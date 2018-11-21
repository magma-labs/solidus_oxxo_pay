# encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
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

  s.add_dependency 'solidus_core', '~> 1.0'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '0.37.2'
  s.add_development_dependency 'rubocop-rspec', '1.4.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
