# Web 615 Final Project 
# Author: Nicholas Gardiner

## Embedded Badge
[![CircleCI](https://circleci.com/gh/nickg1996/12345.svg?style=svg)](https://app.circleci.com/pipelines/github/nickg1996/12345?branch=master)

## Technologies Used

### RSPEC

Rspec provides its DSL that allows us to describe the behavior of objects, classes, and methods in a codebase. It has community-wide support and a rich set of libraries that work alongside it. In RSpec, tests are not just scripts that verify your application code. They’re also specifications (or specs, for short): detailed explanations of how the application is supposed to behave, expressed in plain English.  Because in RSpec our tests are are not just scripts, this makes tests written in RSpec very easy to read by non-technical people.

### Pundit

Pundit allows you build authorization system using ruby classes and oop design patterns. It comes with a set of helpers that allows you to build an authorization system at scale.

### Rubocop

RuboCop is a Ruby static code analyzer and code formatter which we used to enforce coding style guideline in our source code. Rubocop helps us report and automatically fix problems in our code that violates the Ruby style guide we have configured in our .rubocop.yml file


### Airbrake

Airbrake is an online tool that provides robust exception tracking. We use Airbrake to allow us to easily review errors, tie an error to an individual piece of code, and trace the cause back to recent changes in production. The Airbrake dashboard provides us with easy categorization, searching, and prioritization of exceptions so that when errors occur, we can quickly determine the root cause.

### Docker / Docker-compose

Docker is a set of platform as a service products that uses OS-level virtualization to deliver software in packages called containers. By packaging our application as a docker container, we can be rest assured that our application will run and have the same behaviour regardless of any runtime they are deployed on, as long as that run time have Docker installed.

### Heroku

Heroku is a cloud platform as a service supporting several programming languages. Heroku takes the hassle of infrastructure management and automation, allowing you to focus and direct more energy into application development.

## Steps 

* Install the Project Locally
* Set up Bundler
* Run 'bundle install' to get Rubocop and Bundler-Audit (along with everything else)
* Test Pushing to GitHub
* Run 'sudo docker-compose up --build' OR 'Open App' on Heroku
* Create a User Account OR Login with Supplied Info

## Login Information
### Non-Admin
**Email:** schimmel_letitia@example.org


**Password:** password

### Admin
**Email:** schaden.tony@example.com


**Password:** password