#_employees-projects_

####This is a web application in which the user can enter words and definitions and the program will return all words and their definitions. This is an exercise in object-oriented Ruby.

## Technologies Used

Application: Ruby, Sinatra, Active Record<br>
Testing: Rspec, Capybara<br>
Database: Postgres

Installation
------------
CREATE DATABASE hair_salon;
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id integer);
```
$ git clone https://github.com/hrwilliams/hair-salon.git
```

Install required gems:
```
$ bundle install

Start the webserver:
```
$ ruby app.rb
```

Navigate to `localhost:4567` in browser.

License
-------

GNU GPL v2. Copyright 2015 **HR Williams**
