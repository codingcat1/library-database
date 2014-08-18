require 'spec_helper'

describe Author do
  it "initializes a new author with a name" do
    test_author = Author.new({:name => 'Tolkien'})
    expect(test_author).to be_an_instance_of Author
    expect(test_author.name).to eq 'Tolkien'
  end
end
