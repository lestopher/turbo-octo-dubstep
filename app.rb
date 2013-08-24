require 'sinatra'
require 'sinatra/namespace'
require 'haml'
require 'pry'
require 'bcrypt'

class Irb < Sinatra::Application
  register Sinatra::Namespace
  enable :logging if ENV['RACK_ENV'] != 'production'

  use Rack::Session::Cookie, :key => 'rack.session',
                             :path => '/',
                             :expire_after => 25920000,
                             :secret => 'This is a super secure key 123456.'

  get '/' do
    haml :index 
  end
end

require_relative 'models/init'
require_relative 'helpers/init'
require_relative 'routes/init'
