lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'solidus_oxxo_pay/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_oxxo_pay'
  s.version     = SolidusOxxoPay::VERSION
  s.summary     = 'A solidus extension to process payments via Conekta Oxxo'
  s.description = 'This extension process payments using the Conekta Oxxo payment method'
  s.license     = 'MIT'

  s.author    = 'Magmalabs'
  s.email     = 'developers@magmalabs.io'
  s.homepage  = 'https://www.magmalabs.io/'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'solidus', ['>= 2.0', '< 3']
  s.add_dependency 'solidus_support'
  s.add_dependency 'deface', '~> 1.0'
  s.add_dependency 'conekta'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-screenshot'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '>= 0.49.0'
  s.add_development_dependency 'rubocop-rspec', '1.4.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3', '~> 1.3.6'
end
