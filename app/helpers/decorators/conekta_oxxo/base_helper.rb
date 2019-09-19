# frozen_string_literal: true

module Decorators
  module ConektaOxxo
    module BaseHelper
      extend ActiveSupport::Concern

      included do
        helper_method :conekta_oxxo_receipt
      end

      def conekta_oxxo_receipt(payment)
        if payment.source_type == 'Spree::ConektaOxxoPayment'
          response_code = payment.response_code

          render partial: 'spree/conekta/payments/conekta_oxxo',
                 locals: { order: payment.order, response_code: response_code }
        end
      end
    end
  end
end

::Spree::BaseController.include(Decorators::ConektaOxxo::BaseHelper)

