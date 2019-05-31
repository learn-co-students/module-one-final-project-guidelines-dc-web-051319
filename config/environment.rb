require 'bundler'
Bundler.require
require 'rest-client'
require 'json'
require 'pry'


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

# require 'sinatra/activerecord'

ActiveRecord::Base.logger = nil

require_all 'lib'
require_all 'App'
