[![CircleCI](https://circleci.com/gh/magma-labs/solidus_oxxo_pay.svg?style=svg)](https://circleci.com/gh/magma-labs/solidus_oxxo_pay)

SolidusOxxoPay
==============

This extensions allows process payments using mexican payment Conekta Oxxo

Installation
------------

Add solidus_oxxo_pay to your Gemfile:

```ruby
gem 'solidus_oxxo_pay'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g solidus_oxxo_pay:install
```

Setup
-------
- Create an account on [Conekta](https://conekta.com/) and get your api key from an existing or new store
- Add a new payment method using Conekta Oxxo provider on `/admin/payment_methods/new`
- Specify your private api key provided by Conekta in your new payment method

Testing
-------

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs, and [Rubocop](https://github.com/bbatsov/rubocop) static code analysis. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake test_app
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'solidus_oxxo_pay/factories'
```

Copyright (c) 2018 Magmalabs, released under the MIT License
