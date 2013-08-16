require 'active_record'
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/development.sqlite3'
)
require_relative 'person'
require_relative 'address'

