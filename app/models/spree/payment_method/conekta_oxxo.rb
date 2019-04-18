# frozen_string_literal: true

module Spree
  class PaymentMethod::ConektaOxxo < Spree::PaymentMethod
    preference :api_key, :string, default: ''

    def payment_profiles_supported?
      false
    end

    def source_required?
      true
    end

    def gateway_class
      Spree::ConektaOxxoPayment
    end

    def payment_source_class
      Spree::ConektaOxxoPayment
    end

    def auto_capture?
      false
    end
  end
end
