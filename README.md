toyrobot
========

[ ![Codeship Status for xuebingli/toyrobot](https://codeship.com/projects/49d985c0-3de8-0134-b18d-365d6082cf0e/status?branch=master)](https://codeship.com/projects/167277)

A toy robot simulator

This program is developed and tested in Ruby 2.3.1.

# Dependency
All dependencies are **optional** and needed for development and testing only.
- `pry` for debugging
- `rspec` for testing
- `simplecov` for testing coverage report

To install dependencies, run
```shell
$ bundle install
```

# Usage
## Without Docker
Please make sure Ruby 2.3.1 is installed on your machine.

Input can be provided via a file or standard input. To run the program with a file input,
```shell
$ ruby bin/run.rb input.file
```

To read from standard input, simple run
```shell
$ ruby bin/run.rb
PLACE 1,2,NORTH
MOVE
LEFT
REPORT
1,3,WEST
```

## With Docker
This program can be easily run with Ruby's offical docker image since no external dependency is needed.
```shell
$ docker run -it --rm -v $(pwd):/app ruby:2.3.1 /app/bin/run.rb
PLACE 1,2,NORTH
MOVE
LEFT
REPORT
1,3,WEST
```

# Testing
To run tests,
```shell
$ bundle exec rspec
```
Coverage report can be found at `coverage/index.html` after running the command above.

# Assumptions
- Board size shall not change on the fly
- The robot shall move freely on the board, i.e. no obstacle
- The robot shall preserve itself and silently ignore command that results in falling off the board
- Invalid inputs and commands shall be silently ignored
