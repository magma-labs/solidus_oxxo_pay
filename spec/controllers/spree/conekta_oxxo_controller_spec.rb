# frozen_string_literal: true

require 'spec_helper'

describe Spree::ConektaOxxoController, type: :controller do
  describe 'POST create' do
    let(:order) { create(:completed_order_with_pending_payment) }
    let(:payment) { order.payments.first }
    let(:payload) do
      {
        data: {
          'object': {
            'id': '5b92aa54ffecf903b162e58f',
            'livemode': false,
            'created_at': 1_536_338_516,
            'currency': 'MXN',
            'payment_method': {
                'service_name': 'OxxoPay',
                'barcode_url': 'https://s3.amazonaws.com/cash_payment_barcodes/sandbox_reference.png',
                'object': 'cash_payment',
                'type': 'oxxo',
                'expires_at': 1_538_870_400,
                'store_name': 'OXXO',
                'reference': '98_000_000_143_571'
            },
            'object': 'charge',
            'description': 'Payment from order',
            'status': 'paid',
            'amount': 11_000,
            'paid_at': 1_536_338_549,
            'fee': 2448,
            'customer_id': '',
            'order_id': 'ord_2jECBn14PvZcb3Ain'
          },
          'previous_attributes': {
            'status': 'pending_payment'
          }
        }
      }
    end
    let(:status) { 'paid' }
    let(:amount) { (payment.amount * 100).to_i }

    before do
      payment.update_attribute :response_code, '98_000_000_143_571'
      @routes = Spree::Core::Engine.routes
    end

    context 'when payload is successfull' do
      it 'marks the payment as completed (paid)' do
        expect do
          post :create, params: payload
        end.to change { payment.reload.state }.to('completed')
        expect(payment.order.payment_state).to eql('paid')
      end
    end

    context 'when payload is successfull but amount is different' do
      let(:amount) { (payment.amount * 100).to_i - 2 }

      it 'marks the payment as completed (paid)' do
        expect do
          post :create, params: payload
        end.not_to change { payment.state }
      end
    end

    context 'when paylod is not successful' do
      let(:status) { 'pending' }

      it 'keeps the payment state as it is' do
        expect do
          post :create, params: payload
        end.not_to change { payment.state }
      end
    end
  end
end
