require 'bundler'
Bundler.require
require 'cli/ui'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require_all 'app'
#require_all 'db'
