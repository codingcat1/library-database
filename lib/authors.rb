class Author

  attr_accessor :name

  def initialize(attributes)
    @name = attributes[:name]
  end

  def self.all
    @authors = []
    results = DB.exec("SELECT * FROM authors;")
    results.each do |result|
      @authors << Author.new({:name => result['name']})
    end
    @authors
  end

  def save
    results = DB.exec("INSERT INTO authors (name) VALUES ('#{@name}');")
  end

  def ==(another_author)
    self.name == another_author.name
  end

end
