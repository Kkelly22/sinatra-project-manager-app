require './config/environment'

require_relative 'app/controllers/projects_controller'
require_relative 'app/controllers/project_managers_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use ProjectsController
use ProjectManagersController
run ApplicationController
