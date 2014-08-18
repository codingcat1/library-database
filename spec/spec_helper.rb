require 'rspec'
require 'join_table'
require 'authors'
require 'books'
require 'pg'

DB = PG.connect({:dbname => 'library'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM authors *;")
    DB.exec("DELETE FROM books *;")
    DB.exec("DELETE FROM join_table*;")
  end
end


