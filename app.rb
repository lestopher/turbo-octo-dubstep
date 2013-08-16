require 'sinatra'
require 'sinatra/namespace'
require 'haml'
require 'pry'

class Irb < Sinatra::Application
  register Sinatra::Namespace
  enable :logging if ENV['RACK_ENV'] != 'production'

  get '/' do
    haml :index 
  end
end

require_relative 'models/init'
require_relative 'helpers/init'
require_relative 'routes/init'
