require_relative './config/environment'

require './config/environment'

##if ActiveRecord::Migrator.needs_migration?
##  raise 'Migrations are pending. Run `rake db:migrate` to'
##end


begin
  fi_check_migration

  use Rack::MethodOverride
  use SessionsController
  use RecipesController
  use UsersController
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end

#use Rack::MethodOverride
#use SessionsController
#use RecipesController
#use UsersController
#run ApplicationController
