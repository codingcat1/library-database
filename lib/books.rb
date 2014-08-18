class Book
  attr_accessor :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def self.all
    @books = []
    results = DB.exec("SELECT * FROM books;")
    results.each do |result|
      @books << Book.new({:name => result['name'], :id => result['id']})
    end
    @books
  end

  def self.find(search_id)
    results = DB.exec("SELECT * FROM books WHERE id = #{search_id};")[0]
    Book.new({:name => results['name'], :id => results['id']})
  end

  def save
    results = DB.exec("INSERT INTO books (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def delete
    DB.exec("DELETE FROM books WHERE id = #{@id};")
  end

  def ==(another_book)
    self.name == another_book.name
  end

  def add_author(author_id)
    DB.exec("INSERT INTO join_table (authors_id, books_id) VALUES (#{author_id}, #{@id});")
  end

  def get_authors
    @authors_id = []
    results = DB.exec("SELECT authors.* FROM books JOIN join_table ON (join_table.books_id = books_id)
                      JOIN authors ON (join_table.authors_id = authors_id) WHERE books.id = #{@id};")
    results.each do |result|
      @authors_id << Author.new({:id => result['id'], :name => result['name']})
    end
    @authors_id
  end

end
