require 'rspec'
require 'the_ruby_ford'

describe IceAndFire::Character do
  describe '#initialize' do
    it 'defines the given attributes as instance variables' do
      attributes = { 'name' => 'Jon Snow' }

      char = IceAndFire::Character.new(attributes)
      expect(char.name).to eq(attributes['name'])
    end

    it 'does not define variables outside the given attribues' do
      attributes = { 'name' => 'Jon Snow' }

      char = IceAndFire::Character.new(attributes)
      expect(char.titles).to be_nil
    end
  end
end
