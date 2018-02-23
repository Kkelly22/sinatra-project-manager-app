class ProjectManagersController < ApplicationController

  get 'project_managers/:slug' do
    @manager = ProjectManager.find_by_slug(params[:slug])
    erb :'project_managers/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'project_managers/create_project_manager'
    else
      @manager = current_user
      erb :'project_managers/show'
    end
  end

  post '/signup' do
    if params[:username].empty? || params[:password].empty?
      redirect '/signup'
    else
      @manager = ProjectManager.new(:username => params[:username], :password => params[:password], :name => params[:name], :title => params[:title])
      @manager.save
      session[:project_manager_id] = @manager.id
      erb :'project_managers/show'
    end
  end

  get '/login' do
    if logged_in?
      @manager = current_user
      erb :'project_managers/show'
    else
      erb :'project_managers/login'
    end
  end

  post '/login' do
    @manager = ProjectManager.find_by(:username => params[:username])
    if @manager && @manager.authenticate(params[:password])
      session[:project_manager_id] = @manager.id
      erb :'project_managers/show'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect '/login'
    else
      redirect '/'
    end
  end

end
