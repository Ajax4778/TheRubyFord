require 'rspec'
require 'the_ruby_ford'

describe IceAndFire::Book do
  describe '#initialize' do
    it 'defines the given attributes as instance variables' do
      attributes = { 'authors' => ['GRRM'] }

      book = IceAndFire::Book.new(attributes)
      expect(book.authors).to eq(attributes['authors'])
    end

    it 'does not define variables outside the given attribues' do
      attributes = { 'authors' => ['GRRM'] }

      book = IceAndFire::Book.new(attributes)
      expect(book.characters).to be_nil
    end
  end
end
