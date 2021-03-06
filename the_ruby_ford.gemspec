Gem::Specification.new do |s|
  s.name     = 'the_ruby_ford'
  s.version  = '2.8.3'
  s.date     = '2016-05-01'
  s.summary  = 'A Ruby gem for the API of Ice and Fire!'
  s.authors  = ['Adithya "Ajax" Manohar']
  s.email    = 'the.ruby.ford@gmail.com'
  s.files    = [
                  'lib/the_ruby_ford.rb',
                  'lib/ice_and_fire/api_client.rb',
                  'lib/ice_and_fire/base.rb',
                  'lib/ice_and_fire/character.rb',
                  'lib/ice_and_fire/book.rb',
                  'lib/ice_and_fire/house.rb',
                  'lib/ice_and_fire/cache.rb'
               ]
  s.homepage = 'http://rubygems.org/gems/the_ruby_ford'
  s.license  = 'MIT'

  s.add_dependency 'json', '~> 1.8'
  s.add_dependency 'activesupport', '~> 5.0'

  s.add_development_dependency 'rspec', '~> 3.4'
end
