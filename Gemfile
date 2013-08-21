source "http://rubygems.org"

# web engine
gem "sinatra", "1.4.3"
gem "sinatra-contrib"
gem "haml"
gem 'activerecord', '3.2.13'
gem 'standalone_migrations', '2.1.1'
gem 'rack', '1.4.5'
gem 'activerecord-postgresql-adapter'
gem 'bcrypt-ruby', :require => 'bcrypt'

if RUBY_VERSION =~ /1.8/
  gem 'backports', '2.3.0'
  gem 'json'
end

if ENV['RACK_ENV'] != "production"
  gem "pry-debugger"
  gem "sqlite3"
  gem "foreman", "0.63.0"
  gem "thin", "1.5.1"
  gem "rake"
end
