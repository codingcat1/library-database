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

    main_choice = gets.chomp

    if main_choice == '1'
      librarian
    elsif main_choice == '2'
      patron
    elsif main_choice == 'x'
      exit
    else
      puts "Please put valid option"
    end
  end
end

def librarian
  system 'clear'
  loop do
    puts "***WELCOME LIBRARIAN!!!***\n\n"
    puts "[1] to add a book to your library"
    puts "[2] to go to the book menu"
    puts "[3] to add a author to your library"
    puts "[4] to go to your author menu"
    puts "[5] to go back to main menu"

    main_choice = gets.chomp

    if main_choice == '1'
      add_book
    elsif main_choice == '2'
      book_menu
    elsif main_choice == '3'
      add_author
    elsif main_choice == '4'
      author_menu
    elsif main_choice == '5'
      main_menu
    else
      puts "Please put a valid answer."
    end
  end
end

def book_menu(book)
  puts "[1] add an author to your book"
  puts "[2] to search for authors of a book"
  puts "[3] to delete a book"
  puts "[4] to view all books"
  puts "[5] to go back to librarian menu"
  book_menu_choice = gets.chomp

  if book_menu_choice == '1'
    @authors = Author.all
    @authors.each do |author|
      @author_number = Author.all.index(author).to_s
      puts @author_number + " " + author.name
    end
    puts "What author would you like to add to this book?"
    author_choice = gets.chomp.to_i
    book.add_author(@authors[author_choice].id)

  elsif book_menu_choice == '2'
    @books = Book.all
    @books.each do |book|
      @book_number = Book.all.index(book).to_s
      puts @book_number + " " + book.name
    end
    puts "What book would you like to view authors for?"
    book_choice = gets.response
    @books[book_choice].id


  elsif book_menu_choice == '3'
    # book.delete
  elsif book_menu_choice == '4'
    # method to view all books
  elsif book_menu_choice == '5'
    librarian
  else
    puts "Please put a valid answer."
  end
end

def add_book
  puts "What book would you like to add?"
  book_input = gets.chomp
  new_book = Book.new({:name => book_input})
  new_book.save
  puts "#{Book.all.last.name} added to the library"
  book_menu(new_book)
  # book_menu
end

def add_author
  puts "What author would you like to add?"
  author_input = gets.chomp
  Author.new({:name => author_input}).save
  puts "#{Author.all.last.name} added to the library"
end

def book_author
  # List all books available
  puts "What book would you like to add an author to?"
  author_book = gets.chomp
  Book.all
end

main_menu
