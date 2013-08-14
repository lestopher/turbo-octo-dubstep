require 'sinatra'
require 'haml'

class Irb < Sinatra::Application
  get '/' do
    haml :index 
  end
end

require_relative 'models/init'
require_relative 'routes/init'
