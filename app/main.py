from flask import Flask, request
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import func
import json
import re

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:postgres@postgres-db/superhero-db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)


# define model for user table
class User(db.Model):
    __tablename__ = 'superheroes'
    user_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(255), unique=True, nullable=False)
    email = db.Column(db.String(50), unique=True, nullable=False)
    gender = db.Column(db.String(10), nullable=False)
    first_name = db.Column(db.String(50), nullable=False)
    last_name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        return f"{self.user_id, self.username, self.email, self.first_name, self.last_name, self.gender}"

    def to_json(self):
        # Convert the User object to a dictionary
        user_dict = {
            'user_id': self.user_id,
            'username': self.username,
            'email': self.email,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'gender': self.gender
        }
        # Return the dictionary as a JSON string
        return json.dumps(user_dict)


def is_valid_email(email):
    pattern = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
    return bool(re.match(pattern, email))


def is_valid_gender(gender):
    return gender.lower() == 'male' or gender.lower() == 'female' or gender.lower() == 'other'


@app.route('/users', methods=['POST'])
def create_user():
    """Creates a new user, accepting a JSON format body with all required parameters"""
    max_user_id = db.session.query(func.max(User.user_id)).scalar()
    if max_user_id is None:
        new_user_id = 1
    else:
        new_user_id = max_user_id + 1
    data = request.get_json()
    try:
        username = data['username']
        email = data['email']
        gender = data['gender']
        first_name = data['first_name']
        last_name = data['last_name']
    except KeyError:
        return 'Sorry, partial information. Cannot create a new user.', 400
    else:
        if is_valid_email(email=email) and is_valid_gender(gender=gender):
            # create new user object
            user = User(user_id=new_user_id, username=username, email=email, gender=gender, first_name=first_name,
                        last_name=last_name)
            # add user to database
            db.session.add(user)
            db.session.commit()
            return 'User added successfully.', 200
        else:
            return 'oops, your email or gender are incorrect.', 400


@app.route('/users/<user_id>', methods=['GET'])
def read_user(user_id):
    """Returns the user with the specified ID as a JSON object. Parameters: user_id (str): The ID of the user to
    retrieve. """
    if not user_id.isdigit():
        return 'Please enter a valid user ID.', 400
    else:
        # get user from database
        user = User.query.get(user_id)
        if not user:
            return "User not found", 404
        # return user data as JSON
        return user.to_json()


@app.route('/users/all', methods=['GET'])
def list_all_users():
    """Lists all users in the database."""
    # get user from database
    users = User.query.all()
    if not users:
        return 'Sorry, at this time there are no users.', 404
    else:
        user_dict = {user.user_id: User.to_json(user) for user in users}
        # return user data as JSON
        return json.dumps(user_dict)


@app.route('/users/<user_id>', methods=['PUT'])
def update_user(user_id):
    """Updates the username or email of the user with the specified ID. Parameters: user_id (str): The ID of the user
    to update. """
    if not user_id.isdigit():
        return 'Please enter a valid user ID.', 400
    # get user data from request
    data = request.get_json()
    username = data.get('username')
    email = data.get('email')
    # get user from database
    user = User.query.get(user_id)
    if not user:
        return "User not found.", 404

    # update user data if necessary
    if user.username != username or user.email != email:
        user.username = username
        user.email = email
        # save updated user to database
        db.session.commit()
        return 'User updated successfully.', 200
    else:
        return 'Nothing to update. The user is up to date.', 200


@app.route('/users/<user_id>', methods=['DELETE'])
def delete_user(user_id):
    """Deletes the user with the specified ID. Parameters: user_id (str): The ID of the user to delete. """
    if not user_id.isdigit():
        return 'Please enter a valid user ID.', 400
    # get user from database
    user = User.query.get(user_id)
    if not user:
        return "User not found", 404
    # delete user from database
    db.session.delete(user)
    db.session.commit()
    return 'User deleted successfully.', 200


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
