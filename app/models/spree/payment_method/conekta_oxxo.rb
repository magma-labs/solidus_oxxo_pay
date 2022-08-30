# frozen_string_literal: true

module Spree
  class PaymentMethod::ConektaOxxo < Spree::PaymentMethod
    preference :api_key, :string, default: ''
    preference :api_version, :string, default: '2.0.0'

    def partial_name
      'conekta_oxxo'
    end

    def gateway_class
      Spree::ConektaOxxoPayment
    end

    def payment_source_class
      Spree::ConektaOxxoPayment
    end

    def display_on_cart
      options[:display_on_cart] || false
    end

    def cart_partial_name
      'conekta_oxxo'
    end

    def display_on_product_page
      options[:display_on_product_page] || false
    end

    def payment_profiles_supported?
      false
    end

    def source_required?
      true
    end

    def auto_capture?
      false
    end
  end
end
