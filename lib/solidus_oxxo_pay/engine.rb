# frozen_string_literal: true

require 'solidus_oxxo_pay'

module SolidusOxxoPay
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    engine_name 'solidus_oxxo_pay'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'spree.payment_method.add_conekta_oxxo_payment', after: 'spree.register.payment_methods' do |app|
      app.reloader.to_prepare do
        app.config.spree.payment_methods << ::Spree::PaymentMethod::ConektaOxxo
        app.config.assets.precompile += %w(oxxopay_brand.png)
      end
    end
  end
end
