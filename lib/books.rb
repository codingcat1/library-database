class Book
  attr_accessor :name

  def initialize(attributes)
    @name = attributes[:name]
  end

  def self.all
    @books = []
    results = DB.exec("SELECT * FROM books;")
    results.each do |result|
      @books << Book.new({:name => result['name']})
    end
    @books
  end

  def save
    results = DB.exec("INSERT INTO books (name) VALUES ('#{@name}') ;")
  end

  def ==(another_book)
    self.name == another_book.name
  end



end
