require 'rspec'
require 'the_ruby_ford'

describe IceAndFire::House do
  describe '#initialize' do
    it 'defines the given attributes as instance variables' do
      attributes = { 'name' => 'House Dayne of Starfall' }

      house = IceAndFire::House.new(attributes)
      expect(house.name).to eq(attributes['name'])
    end

    it 'does not define variables outside the given attribues' do
      attributes = { 'name' => 'House Dayne of Starfall' }

      house = IceAndFire::House.new(attributes)
      expect(house.region).to be_nil
    end
  end
end
