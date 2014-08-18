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

end
