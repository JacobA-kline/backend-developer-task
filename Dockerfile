FROM python:3.7-slim-buster

EXPOSE 5000

COPY ./app /app

WORKDIR /app

RUN python3 -m venv venv && . venv/bin/activate

RUN pip install --upgrade pip && pip install -r requirements.txt

CMD ["python3", "main.py"]




