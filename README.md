# Rails Engine
This project was completed by [Deb Hamel](https://github.com/deborahleehamel) and [Charlie Kaminer](https://github.com/ckaminer).

## Setup
Clone down the repo
```
git clone https://github.com/ckaminer/rails_engine.git
```
then run
```
cd rails_engine
```
Run `bundle` and then run the following commands from your command line to set up and seed your data.

then run
```
rails db:drop db:create db:migrate
```
then run
```
rake csv:import_all
```

## Test Suite
This repo uses the RSpec testing suite.  To run the test suite run:
```
rspec
```

## Spec Harness
To run the spec harness, first clone down the repo (make sure you are in the same directory that your project lives in). You may need to  `cd`  up to the directory.

```
git clone https://github.com/turingschool/rales_engine_spec_harness
```
then

```
cd rales_engine_spec_harness
```
finally, run `rake`

## Briefing
Rails Engine is a project at Turing School designed to test the deployment of an API only rails application.  Additionally, business logic is accomplished using advanced ActiveRecord queries. The original project spec can be found [here](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md#technical-expectations).
