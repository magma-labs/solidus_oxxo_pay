# frozen_string_literal: true

module SolidusOxxoPay
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'solidus_oxxo_pay'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'spree_payment_network.register.payment_methods' do |app|
      app.config.spree.payment_methods << Spree::PaymentMethod::ConektaOxxo
      app.config.assets.precompile += %w(oxxopay_brand.png)
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/decorators/**/*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
