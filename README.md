toyrobot
========

[ ![Codeship Status for xuebingli/toyrobot](https://codeship.com/projects/49d985c0-3de8-0134-b18d-365d6082cf0e/status?branch=master)](https://codeship.com/projects/167277)

A toy robot simulator

This program is developed and tested in ruby 2.1.3p242.

Optional
- pry for debugging
- simplecov for testing coverage report

Note that pry and simplecov are NOT needed to run the program.

<h1>Usage</h1>
Input can be from a file or from standard input. To run the program with a file input,

```
ruby bin/run.rb sample.input
```

Otherwise, simple run

```
ruby bin/run.rb
```

To run tests,

```
rake tests
```

<h1>Assumptions</h1>
- All inputs are in valid format
- Board size does not change on the fly
