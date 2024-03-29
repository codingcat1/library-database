require 'spec_helper'

describe Author do
  it "initializes a new author with a name" do
    test_author = Author.new({:name => 'Tolkien'})
    expect(test_author).to be_an_instance_of Author
    expect(test_author.name).to eq 'Tolkien'
  end

  it "starts with an empty array of authors" do
    expect(Author.all).to eq []
  end

  it "adds a author and saves it" do
    test_author = Author.new({:name => 'Tolkien'})
    test_author.save
    expect(Author.all).to eq [test_author]
  end

  it "returns true if two authors have the same attributes" do
    test_author1 = Author.new({:name => 'Tolkien'})
    test_author2 = Author.new({:name => 'Tolkien'})
    expect(test_author1).to eq test_author2
  end

  it "sets an ID when you save it" do
    test_author = Author.new({:name => 'Tolkien'})
    test_author.save
    expect(test_author.id).to be_an_instance_of Fixnum
  end

  # describe '.find' do
  it 'returns the author from the database with the matching id' do
    test_author = Author.new({:name =>'Tolkien', :id => 1})
    test_author.save
    expect(Author.find(test_author.id)).to eq test_author
  end
  # end

  it "will delete an instance of the author" do
    test_author = Author.new({:name => 'Tolkien'})
    test_author.save
    test_author1 = Author.new({:name => 'J.K. Rowling'})
    test_author1.save
    test_author.delete
    expect(Author.all).to eq [test_author1]
  end


end
