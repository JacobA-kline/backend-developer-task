#!/bin/bash

# Author: Jacob Kline
# Date: 14/12/22
# Last Modified: 14/12/22

# Description:
# Initialize the postgres database with a table called superheros

# Usage:
# Triggered automatically by docker at docker-entrypoint-initdb.d. The script can be found at /usr/local/bin/docker-
# entrypoint.sh

psql -d superhero-db -c "CREATE TABLE SuperHeroes(
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(255) UNIQUE,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50) UNIQUE,
  gender VARCHAR(10)
);
INSERT INTO SuperHeroes (user_id, username, first_name, last_name, email, gender) VALUES
(1, 'Superman', 'CLark', 'Kent', 'CLarkKent@yahoo.com', 'Male'),
(2, 'Batman', 'Bruce', 'Wayne', 'BruceWayne@gmail.com', 'Male'),
(3, 'Spiderman', 'Peter', 'Parker', 'PeterParker@hotmail.com', 'Male'),
(4, 'Hulk', 'Bruce', 'Banner', 'BruceBanner@gmail.com', 'Male'),
(5, 'Captain America', 'Steve', 'Rogers', 'SteveRogers@walla.co.il', 'Male'),
(6, 'Green Hornet', 'Britt', 'Reid', 'BrittReid@gmail.com', 'Male'),
(7, 'Green Lantern', 'Hal', 'Jordan', 'HalJordan@hotmail.com', 'Male'),
(8, 'Wolverine', 'James', 'Howlett', 'JamesHowlett@yahoo.com', 'Male'),
(9, 'Mr.Fantastic', 'Reed', 'Richards', 'ReedRichards@gmail.com', 'Male'),
(10, 'Flash', 'Barry', 'Allen', 'BarryAllen@walla.co.il', 'Male'),
(11, 'Cyclops', 'Scott', 'Summers', 'ScottSummers@gmail.com', 'Male'),
(12, 'Phantom', 'Kit', 'Walker Jr.', 'KitWalkerJr@gmail.com', 'Male'),
(13, 'Catwoman', 'Selina', 'Kyle', 'SelinaKyle@yahoo.com', 'Female'),
(14, 'Wonder Woman', 'Diana', 'Prince', 'DianaPrince@gmail.com', 'Female'),
(15, 'Batgirl', 'Barbara', 'Gordon', 'BarbaraGordon@yahoo.com', 'Female'),
(16, 'StormXX', 'Ororo', 'Monroe', 'OroroMonroe@gmail.com', 'Female'),
(17, 'Black Widow', 'Natasha', 'Romanova', 'NatashaRomanova@walla.co.il', 'Female'),
(18, 'Phoenix', 'Jean', 'Grey', 'JeanGrey@gmail.com', 'Female');"




