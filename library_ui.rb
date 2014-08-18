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
    puts "[2] to search for a book"
    puts "[3] to update a book"
    puts "[4] to view all books"
    puts "[5] to go back to main menu"

    main_choice = gets.chomp

    if main_choice == '1'
      add_book
    elsif main_choice == '2'
      search_book
    elsif main_choice == '3'
      update_book
    elsif main_choice == '4'
      view_books
    elsif main_choice == '5'
      main_menu
    else
      puts "Please put a valid answer silly"
    end

  end
end
