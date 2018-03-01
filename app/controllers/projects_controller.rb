require 'rack-flash'
class ProjectsController < ApplicationController
  enable :sessions
  use Rack::Flash

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
        @project = Project.new(:project_number => params[:project_number], :project_name => params[:project_name], :delivery_date => params[:delivery_date], :budget_remaining => params[:budget_remaining], :status => params[:status])

        @client = Client.find_by_id(params[:project][:client_id])
        if @client
          @project.client = @client
        end

        @project_manager = ProjectManager.find_by_id(params[:project][:project_manager_id])
        if @project_manager
          @project.project_manager = @project_manager
        end

        @project.save
        if @project.save
          flash[:message] = "Successfully created project."
          redirect "/projects/#{@project.id}"
        else
          flash[:message] = "There was an error creating the project, please try again."
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
        @project.project_number = params[:project_number]
        @project.project_name = params[:project_name]
        @project.delivery_date = params[:delivery_date]
        @project.budget_remaining = params[:budget_remaining]
        @project.status = params[:status]
        @project.save
        if @project.save
          flash[:message] = "Successfully updated project."
          redirect "/projects/#{params[:id]}"
        else
          flash[:message] = "There was an error updating the project, please try again."
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
        flash[:message] = "Project successfully deleted."
        redirect '/projects'
      else
        flash[:message] = "There was an error deleting the project, please try again."
        redirect "/projects/#{params[:id]}"
      end
    else
      redirect '/login'
    end
  end


end
