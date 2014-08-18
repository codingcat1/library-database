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
end
