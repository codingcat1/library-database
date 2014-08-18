require 'pg'
require './lib/books'
require './lib/authors'


DB = PG.connect({:dbname => 'library'})

