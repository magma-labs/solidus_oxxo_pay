source 'https://rubygems.org'

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'solidus', github: 'solidusio/solidus', branch: branch

gem 'conekta'
gem 'solidus_auth_devise', '~> 1.0'
gem 'pg', '~> 0.21'
gem 'sqlite3', '~> 1.3'

group :test do
  gem 'rspec', '~> 3.8'
  gem 'rspec-rails', '~> 3.8'
  gem 'simplecov', '~> 0.16'
  gem 'sql', '~> 0.0.1'
  gem 'database_cleaner', '1.7'
  if branch == 'master' || branch >= "v2.5"
    gem 'factory_bot', '> 4.10'
  else
    gem 'factory_bot', '4.10'
  end
  gem 'pry', '~> 0.12'
end

gemspec
