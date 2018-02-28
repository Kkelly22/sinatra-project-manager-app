require 'rack-flash'
class ClientsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/clients' do
    if logged_in?
      @clients = Client.all
      erb :'clients/index'
    else
      redirect '/login'
    end
  end

  get '/clients/new' do
    if logged_in?
      erb :'clients/create_client'
    else
      redirect '/login'
    end
  end

  post '/clients' do
    if logged_in?
      if params[:content] == ""
        redirect '/clients/new'
      else
        @client = Client.new(:name => params[:name])
        @client.save
        if @client.save
          flash[:message] = "Successfully created client."
          redirect "clients/#{@client.id}"
        else
          flash[:message] = "There was an error creating client.  Please try again."
          redirect '/clients/new'
        end
      end
    else
      redirect '/login'
    end
  end

  get '/clients/:id' do
    if logged_in?
      @client = Client.find_by_id(params[:id])
      erb :'clients/show'
    else
      redirect '/login'
    end
  end

  get '/clients/:id/edit' do
    if logged_in?
      @client = Client.find_by_id(params[:id])
      erb :'clients/edit'
    else
      redirect '/login'
    end
  end

end
