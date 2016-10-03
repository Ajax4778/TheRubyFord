require 'rspec'
require 'the_ruby_ford'

describe IceAndFire::Cache do
  describe '#[]' do
    context 'if the requested object exists in the cache' do
      it 'returns the object' do
        api_object = { 'name' => 'Jon Snow' }
        req_string = 'characters/583'

        cache = IceAndFire::Cache.new(req_string.to_sym => api_object)
        expect(cache[req_string]).to eq(api_object)
      end
    end

    context 'if the requested object does not exist in the cache' do
      it 'returns nil' do
        req_string = 'characters/583'

        cache = IceAndFire::Cache.new
        expect(cache[req_string]).to be_nil
      end
    end
  end

  describe '#[]=' do
    let(:api_object) { { 'name' => 'Jon Snow' } }
    let(:req_string) { 'characters/583' }

    it 'adds the given object to the cache' do
      cache = IceAndFire::Cache.new
      cache[req_string] = api_object

      expect(cache[req_string]).to eq(api_object)
    end

    it 'clears cache and adds object if cache reaches max size' do
      cache = IceAndFire::Cache.new(a: 1, b: 2, c: 3)
      stub_const('IceAndFire::Cache::DEFAULT_CACHE_LIMIT', 3)
      cache[req_string] = api_object

      expect(cache[req_string]).to eq(api_object)
    end
  end
end
