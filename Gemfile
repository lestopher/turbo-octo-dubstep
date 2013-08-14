source "http://rubygems.org"

# web engine
gem "sinatra", "1.4.3"
gem "haml"
gem 'activerecord', '4.0.0'

if RUBY_VERSION =~ /1.8/
  gem 'backports', '2.3.0'
  gem 'json'
end

if ENV['RACK_ENV'] != "production"
  gem "sqlite3"
  gem "rack-test", "0.6.2"
  gem "foreman", "0.63.0"
  gem "thin", "1.5.1"
  gem "rake"
end
