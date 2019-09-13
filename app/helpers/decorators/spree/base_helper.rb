# frozen_string_literal: true

module Decorators
  module Spree
    module BaseHelper
      def conekta_oxxo_receipt(order = nil)
        order_oxxo_payments = order&.payments&.
            where(source_type: 'Spree::ConektaOxxoPayment')
        if order_oxxo_payments.any?
          response_code = order_oxxo_payments.last&.response_code
          render partial: 'spree/conekta/payments/conekta_oxxo',
                 locals: { order: order, response_code: response_code }
        end
      end
    end
  end
end
