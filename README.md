# interview_project
[![Build Status](https://travis-ci.org/diamond29/interview_project.svg?branch=master)](https://travis-ci.org/diamond29/interview_project)

A little project for an interview. Set up a webserver that sends some information to a client, client stores some information in a relational database and prints output.

Requires

1. Postgresql service running on default port 5432 with the "postgres" user being able to create databases. If you don't have one running, you can run the postgres docker container with `bin/run_docker_postgres`

2. Ruby - tested with version 2.3.0 but might work with others

Running the code

```
# Create the database
bin/create_db

# install ruby gems
bundle install

# To run the web server:
bundle exec bin/server

# To run the client:
bundle exec bin/client
