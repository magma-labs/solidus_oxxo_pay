module Spree
  class ConektaOxxoController < StoreController
    skip_before_action :verify_authenticity_token

    def create
      if params[:data][:object][:object] == 'charge' && params[:data][:object][:status] == 'paid'
        payment = Spree::Payment.find_by(response_code: params[:data][:object][:payment_method][:reference])
        policy = PaymentOxxoPolicy.new(payment)
        policy.process(params[:data][:object])
      end
      head :ok
    end

    def receipt
      @payment = Spree::Payment.find(params[:id])
      render layout: false
    end
  end
end
