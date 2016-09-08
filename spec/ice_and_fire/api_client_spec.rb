require 'rspec'
require 'the_ruby_ford'

describe IceAndFire::ApiClient do
  before do
    @client = IceAndFire::ApiClient.new
  end

  describe 'get' do
    context 'if the requested object is already cached' do
      let(:req_string) { 'houses/99'}
      let(:cached_obj) { { name: 'House Dayne of Starfall' } }

      it 'does not make an API call' do
        @client.instance_variable_set(
          '@cache', IceAndFire::Cache.new({ req_string.to_sym => cached_obj })
        )

        expect(Net::HTTP::Get).to_not receive(:new)
        @client.get(req_string)
      end

      it 'returns the cached object' do
        @client.instance_variable_set(
          '@cache', IceAndFire::Cache.new({ req_string.to_sym => cached_obj })
        )

        result = @client.get(req_string)
        expect(result).to be(cached_obj)
      end
    end

    context 'if the requested object is not cached' do
      let(:req_string) { 'characters/47' }
      let(:name) { 'Aegor Rivers' }

      it 'makes an API call for the object' do
        result = @client.get(req_string)
        expect(result['name']).to eq(name)
      end

      it 'caches the object after receiving it' do
        result = @client.get(req_string)
        cache  = @client.instance_variable_get('@cache')

        expect(cache[req_string]).to be(result)
      end
    end
  end
end
