require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

require 'pry'
require 'active_record'
require 'faker'
require 'database_cleaner'

require './app/models/item'
require './app/models/user'

# Connect to the DB
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/test.sqlite3'
)

# Recreate the database
ActiveRecord::Migration.suppress_messages do
  require './db/schema.rb'
end

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

I18n.enforce_available_locales = false
