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

* ...
