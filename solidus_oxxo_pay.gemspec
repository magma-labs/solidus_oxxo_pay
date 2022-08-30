# frozen_string_literal: true

require_relative 'lib/solidus_oxxo_pay/version'

Gem::Specification.new do |s|
  s.name = 'solidus_oxxo_pay'
  s.version = SolidusOxxoPay::VERSION
  s.authors = ['Magmalabs']
  s.email = 'developers@magmalabs.io'

  s.summary = 'A solidus extension to process payments via Conekta Oxxo'
  s.description = 'This extension process payments using the Conekta Oxxo payment method'
  s.homepage = 'http://github.com/magma-labs/solidus_oxxo_pay'
  s.license = 'BSD-3-Clause'

  if s.respond_to?(:metadata)
    s.metadata['homepage_uri'] = s.homepage if s.homepage
    s.metadata['source_code_uri'] = s.homepage if s.homepage
    s.metadata['rubygems_mfa_required'] = 'true'
  end

  s.required_ruby_version = Gem::Requirement.new('>= 2.5')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  s.files = files.grep_v(%r{^(test|spec|features)/})
  s.test_files = files.grep(%r{^(test|spec|features)/})
  s.bindir = 'exe'
  s.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  solidus_version = ['>= 2.6', '< 4']

  s.add_dependency 'conekta'
  s.add_dependency 'deface', '~> 1.0'
  s.add_dependency 'solidus_core', solidus_version
  s.add_dependency 'solidus_support', '~> 0.5'

  s.add_development_dependency 'solidus_backend', solidus_version
  s.add_development_dependency 'solidus_dev_support', '~> 2.5'
  s.add_development_dependency 'solidus_frontend', solidus_version
end
