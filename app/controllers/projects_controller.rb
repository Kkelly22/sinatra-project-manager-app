class ProjectsController < ApplicationController

  get '/projects' do
    if logged_in?
      @projects = Project.all
      erb :'projects/index'
    else
      redirect '/login'
    end
  end

  get '/projects/new' do
    if logged_in?
      erb :'projects/new'
    else
      redirect '/login'
    end
  end

  post '/projects' do
    if logged_in?
      if params[:content] == ""
        redirect '/projects/new'
      else
        @project = Project.new(:description => params[:description], :priority => params[:priority], :budget => params[:budget])
        @project.save
        if @project.save
          redirect "/projects/#{@project.id}"
        else
          redirect '/projects/new'
        end
      end
    else
      redirect '/login'
    end
  end

  get '/projects/:id' do
    if logged_in?
      @project = Project.find_by_id(params[:id])
      erb :'projects/show'
    else
      redirect '/login'
    end
  end

  get '/projects/:id/edit' do
    if logged_in?
      @project = Project.find_by_id(params[:id])
      if @project && @project.project_manager = current_user
        erb :'projects/edit'
      else
        redirect '/projects'
      end
    else
      redirect '/login'
    end
  end

  patch '/projects/:id' do
    if logged_in?
      if params[:content] == ""
        redirect "/projects/#{params[:id]}/edit"
      else
        @project = Project.find_by_id(params[:id])
        @project.description = params[:description]
        @project.priority = params[:priority]
        @project.budget = params[:budget]
        @project.save
        if @project.save
          redirect "/projects/#{params[:id]}"
        else
          redirect "/projects/#{params[:id]}/edit"
        end
      end
    else
      redirect '/login'
    end
  end

  get '/projects/:id/delete' do
    if logged_in?
      @project = Project.find_by_id(params[:id])
      if @project && @project.project_manager = current_user
        @project.delete
        redirect '/projects'
      else
        redirect "/projects/#{params[:id]}"
      end
    else
      redirect '/login'
    end
  end


end
