require 'rack-flash'
class ClientsController < ApplicationController
  enable :sessions
  use Rack::Flash

  

end
