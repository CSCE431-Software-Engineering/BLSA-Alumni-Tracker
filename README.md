# README

## Installation
```bash
bundle install
rails db:create
rails db:schema:load
rails db:seed
```

## Running the Server (Locally)
We use Tailwind CSS, so make sure to precompile assets before running (currently you must do this every time to reflect changes)

```bash
rails assets:precompile # compile tailwind.css assets
rails server --binding=0.0.0.0
```

> I suggest using an alias because its a pain to type this out all the time. \
> `alias rs="rails assets:precompile && rails server --binding=0.0.0.0"`

Please see the [tools README](blsa_tools/README.md) for additional helpful commands to use during development.

## Testing
Run `rspec spec` to run tests. \
See `coverage/index.html` for the SimpleCov coverage.

## Deployment Bugfixing
1. Is the new link known by Google Cloud OAuth?
2. Does the Heroku app have the postgres db plugin?
3. Do all ruby files end with LF and not CRLF?

## Security
Run [brakeman](https://brakemanscanner.org/docs/quickstart/) for a short security analysis. \
EX: `brakeman -o brakeman.txt`

## Additional Notes
* Ruby version: `3.1.2`

* System dependencies: `postgresql`

* Configuration

* Database creation: See Installation Section

* Database initialization: See Installation Section

* How to run the test suite: See Testing Section

* Services (job queues, cache servers, search engines, etc.): None

* Deployment instructions
if having trouble deploying try running "find ./ -type f -exec dos2unix {} +" to convert all files to unix format
also ensure that the new url has been added to the google authorization

* ...

* Running site with tailwind
make sure to precompile assets before running (currently you must do this every time to reflect changes)
rails assets:precompile
rails server --binding=0.0.0.0

* TDD
if you would like to just run a specific test file you can use the command:
rspec spec/system/file_name_spec.rb
a useful variation of this is to use a wildcard * and run all test files related to a specific object:
rspec spec/system/*_users_spec.rb
