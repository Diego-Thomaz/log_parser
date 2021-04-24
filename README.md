# LogParser

Simple log parser which counts how many times a page has been visited based on logfile

## Installation

First, clone the project.

And then execute:

`bundle install`

## Usage

This logparser is really simple to use, and has two types of output: Total Number of Visits, and Total Number of Unique Visits

To check total number of visits you might run:
`ruby bin/read_entries.rb fixtures/webserver.log`

and for total number of unique visits:
`ruby bin/read_entries.rb fixtures/webserver.log -u`

## Architecture

This is a simple Ruby app, that accepts a file path as a parameter. Log reader uses an efficient way to read files.
The way it's implemented it won't blow up the memory, because `each_line` read up until the next newline, return, and pause reading.
When all lines were read, a printer function is called to show the results.

Although the reader is efficient in terms of memory management, we can eventually override it to use other approches. This can be easily done by overriding the reader parameter in the method `call` inside `LogParser::Parse` class.

## What can be done next?

- This app still misses a custom error class, where we can share better error messages with the users.
- This app also needs a better way to handle the second argument. E.g.: If a user passes an invalid argument as -p the app will bring the total number of page visits, without any messages for the user.

## Tests

To run the whole test suite, you can execute:
`bundle exec rspec`