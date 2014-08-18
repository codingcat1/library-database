require 'pg'
require './lib/books'
require './lib/authors'


DB = PG.connect({:dbname => 'library'})

def main_menu
  system 'clear'
  loop do
    puts "*** WELCOME TO SEA OF BOOKS ***\n\n"
    puts "[1] to enter librarian's menu"
    puts "[2] to enter patron's menu"
    puts "[x] to exit"
  end
end

def librarian
  system 'clear'
  loop do
    puts "***WELCOME LIBRARIAN!!!***\n\n"
    puts "[1] to add a book to your library"
    puts "[2] to add a author to your library"
    puts "[3] to search for a book"
    puts "[4] to update a book"
    puts "[5] to view all books"
    puts "[6] to go back to main menu"

    main_choice = gets.chomp

    if main_choice == '1'
      add_book
    elsif main_choice == '2'
      add_author
    elsif main_choice == '3'
      search_book
    elsif main_choice == '4'
      update_book
    elsif main_choice == '5'
      view_books
    elsif main_choice == '6'
      main_menu
    else
      puts "Please put a valid answer silly"
    end
  end
end

def add_book
  puts "What book would you like to add?"
  book_input = gets.chomp
  Book.new({:name => book_input}).save
  puts "#{Book.all.last.name} added to the library"
end

def add_author
  puts "What author would you like to add?"
  author_input = gets.chomp
  Author.new({:name => author_input}).save
  puts "#{Author.all.last.name} added to the library"
end
