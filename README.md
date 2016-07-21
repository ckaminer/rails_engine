# Rails Engine

## Setup
Clone down the repo
```
git clone https://github.com/ckaminer/rails_engine.git
```
Run the following commands from your command line to set up and seed your data:
```
rake db:create db:migrate csv:import_all
```
## Test Suite
This repo uses the RSpec testing suite.  To run the test suite run:
```
rspec
```
## Briefing
Rails Engine is a project at Turing School designed to test the deployment of an API only rails application.  Additionally, business logic is accomplished using advanced ActiveRecord queries. The original project spec can be found [here](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md#technical-expectations).
