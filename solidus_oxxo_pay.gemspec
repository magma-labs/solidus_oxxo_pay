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

  s.add_dependency 'conekta'
  s.add_dependency 'solidus_core', '>= 2.0.0'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'sqlite3'
end
