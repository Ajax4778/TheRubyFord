require 'rspec'
require 'the_ruby_ford'

describe IceAndFire::Base do
  describe '#initialize' do
    context 'with a valid attribute hash' do
      it 'defines the given attributes as instance variables' do
        valid_attributes = {
          'authors'       => ['Author 1', 'Author 2'],
          'characters'    => ['Character 1', 'Character 2'],
          'country'       => 'Country',
          'isbn'          => '000-0000000000',
          'mediaType'     => 'Hardcover',
          'name'          => 'Another Book',
          'numberOfPages' => 100,
          'povCharacters' => ['Character 1'],
          'publisher'     => 'Book Publisher',
          'released'      => 'Release Date',
          'url'           => 'http://anapioficeandfire.com/api/books/id'
        }

        book = IceAndFire::Book.new(valid_attributes)
        valid_attributes.each { |k, v| expect(book.send(k.underscore.to_sym)).to eq(v) }
      end
    end

    context 'with an invalid attributes hash' do
      it 'raises an error' do
        invalid_attributes = {
          'authors' => ['Author 1', 'Author 2'],
          'other'   => 'Invalid Field'
        }

        expect { IceAndFire::Book.new(invalid_attributes) }.to raise_error(/Invalid/)
      end
    end
  end
end
