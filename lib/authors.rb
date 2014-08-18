class Author

  attr_accessor :name

  def initialize(attributes)
    @name = attributes[:name]
  end

  def self.all
    @authors = []
  end
end
