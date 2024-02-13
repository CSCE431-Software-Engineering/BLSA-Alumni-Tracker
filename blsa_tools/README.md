# List of Commands
Add things here if what you do requires additional commands.

## Common Comands
| Description | Command | Note |
| -------- | ------- | ------- |
| Run server with tailwind | `rails assets:precompile && rails server --binding=0.0.0.0` |
| Migrate server | `rails db:migrate` |
| Install new dependencies | `bundle install` |
| Run brakeman | `brakeman` |

## Useful Commands
| Description | Command | Note |
| -------- | ------- | ------- |
| Rebuild test database from scratch  | `RAILS_ENV=test rails db:drop && rails db:create && rails db:schema:load` |
| Run server with tailwind | `rails assets:precompile && rails server --binding=0.0.0.0` |
| Remove all dependencies not in Gemfile | `bundle clean` |
|  |  |
|  |  |
