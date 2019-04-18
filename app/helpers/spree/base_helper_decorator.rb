# frozen_string_literal: true

module Spree::BaseHelper
  def conekta_oxxo_receipt(order = nil)
    @order ||= order
    if @order.paid_with?('Oxxo')
      response_code = @order.payments&.last&.response_code
      render partial: 'spree/conekta/payments/conekta_oxxo', locals: { order: @order, response_code: response_code }
    end
  end
end
