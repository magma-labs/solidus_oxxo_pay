# frozen_string_literal: true

class PaymentOxxoPolicy
  attr_reader :payment

  def initialize(payment)
    @payment = payment
  end

  def process(options)
    return unless options[:status].eql?('paid')

    payment.complete if ((options[:amount].to_i / 100) - payment.amount).abs < 0.01
    payment.order.updater.update
  end
end
