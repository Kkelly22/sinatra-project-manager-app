class Project < ActiveRecord::Base
  belongs_to :project_manager
  belongs_to :client
end
