# README

## Installation
```bash
bundle install
rails db:create
rails db:schema:load
```

## Running the Server (Locally)
Running site with tailwind
make sure to precompile assets before running (currently you must do this every time to reflect changes)

```bash
rails assets:precompile # compile tailwind.css assets
rails server --binding=0.0.0.0
```

Please see the [tools README](blsa_tools/README.md) for additional helpful commands to use during development.

## Additional Notes
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
if having trouble deploying try running "find ./ -type f -exec dos2unix {} +" to convert all files to unix format
also ensure that the new url has been added to the google authorization

* ...

* Running site with tailwind
make sure to precompile assets before running (currently you must do this every time to reflect changes)
rails assets:precompile
rails server --binding=0.0.0.0

* TDD
if you would like to just run a specifc test file you can use the command:
rspec spec/system/file_name_spec.rb
a useful variation of this is to use a wildcard * and run all test files related to a specific object:
rspec spec/system/*_users_spec.rb
