require 'rack-flash'
class ClientsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/clients/new' do
    erb :'clients/create_client'
  end

  post '/clients' do
      @client = Client.new(:name => params[:name])
      @client.save
      erb :'clients/show'
  end

end
