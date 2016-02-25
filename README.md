# interview_project
[![Build Status](https://travis-ci.org/diamond29/interview_project.svg?branch=master)](https://travis-ci.org/diamond29/interview_project)

A little project for an interview. Set up a webserver that sends some information to a client, client stores some information in a postgresql relational database and prints output.

### Requires

1. Postgresql service running on default port 5432 with the "postgres" user being able to create databases. If you don't have one running, you can run the postgres docker container with `bin/run_docker_postgres`

2. Ruby - tested with version 2.3.0 but might work with others

### Running the code

```
# Create the database
bin/create_db

# install ruby gems
bundle install

# run rspec tests and rubocop
bundle exec rake

# run the web server:
bundle exec bin/server

# run the client:
bundle exec bin/client
```

### Why I chose the language/frameworks/tools
I chose ruby because it's my favorite language for getting stuff done and lets me be the most expressive. Other languages I've used before like c++, java, c# would have all taken a lot longer and the result would have been more verbose.

The reason I used Sinatra was because this homework only required one simple api and Sinatra is really good at simple http apis. I chose to actually use a postgres service because it was the easiest way for me to verify my solution. I also wanted to try writing some raw SQL instead of using ActiveRecord, which is the only SQL interface I've used for ruby so far. I used rspec because I wanted an easy way of verifying all the pieces of my code. Bundler, rake, travis, git etc were all standard ways of solving standard problems with ruby/github (CI, dependency management, driving tasks/task dependencies).
