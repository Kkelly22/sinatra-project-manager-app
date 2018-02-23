require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

######## Helper Methods ##############
  helpers do
    def logged_in?
      !!session[:project_manager_id]
    end

    def current_user
      ProjectManager.find(session[:project_manager_id])
    end
  end
end
