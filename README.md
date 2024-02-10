# README

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