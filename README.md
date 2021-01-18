# Find the kittens

## Description
Solution for the missing kittens challenge.

## Install the dependencies
From the project's root folder, run:

```
bundle install
```

## Tests
The project has unit tests under the folder `spec/`.

All external requests are stubbed with webmock.


### How to run the tests
From the project's root folder, run:

```
bundle exec rspec
```

## Code linter
The project uses the Rubocop linter to ensure code quality and consistency accross the code base

### How to run the linter
From the project's root folder, run:

```
bundle exec rubocop
```

## Demo
The code has a `demo.rb` which puts all the code together and runs it against the `data/the booking_requests` file.

### How to run the demo
From the project's root folder, run:

```
ruby demo.rb
```
