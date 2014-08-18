require 'spec_helper'


describe Book do
  it "initializes a new book with a name" do
    test_book = Book.new({:name => 'LOTR'})
    expect(test_book).to be_an_instance_of Book
    expect(test_book.name).to eq 'LOTR'
  end

  it "starts with an empty array of books" do
    expect(Book.all).to eq []
  end

  it "adds a book and saves it" do
    test_book = Book.new({:name => 'LOTR'})
    test_book.save
    expect(Book.all).to eq [test_book]
  end

  it "returns true if two books have the same attributes" do
    test_book1 = Book.new({:name => 'LOTR'})
    test_book2 = Book.new({:name => 'LOTR'})
    expect(test_book1).to eq test_book2
  end

  it "sets an ID when you save it" do
    test_book = Book.new({:name => 'LOTR'})
    test_book.save
    expect(test_book.id).to be_an_instance_of Fixnum
  end

  it "adds authors to a book" do
    test_book = Book.new({:name => 'LOTR'})
    test_book.save
    test_author = Author.new({:name => 'Tolkien'})
    test_author.save
    test_book.add_author(test_author.id)
    expect(test_book.get_authors).to eq [test_author]
  end

  # describe '.find' do
    it 'returns the book from the database with the matching id' do
      test_book = Book.new({:name =>'LOTR', :id => 1})
      test_book.save
      expect(Book.find(test_book.id)).to eq test_book
    end
  # end
end
