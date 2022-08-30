# frozen_string_literal: true

require 'conekta'

module Spree
  class ConektaOxxoPayment < Spree::PaymentSource
    attr_accessor :server, :test_mode, :api_key, :test

    def authorize(_money, source, _gateway_options)
      ::Conekta.api_key = api_key
      ::Conekta.api_version = '2.0.0'

      order = Spree::Order.find_by(number: source.number)

      begin
        response = ::Conekta::Order.create(payload(order))
        source.update(:conekta_order_id, response.id)
        ActiveMerchant::Billing::Response.new(
          true,
          'Orden creada satisfactoriamente',
          {},
          parse_response(response)
        )
      rescue ::Conekta::Error => e
        ActiveMerchant::Billing::Response.new(
          false,
          e.details.map(&:message).join(', ')
        )
      end
    end

    def name
      'Oxxo Pay'
    end

    def month
      payment_method.updated_at.month
    end

    def year
      payment_method.updated_at.year
    end

    def cc_type
      'N/A'
    end

    def last_digits
      'N/A'
    end

    def actions
      %w(void)
    end

    def gateway_customer_profile_id
      user_id
    end

    def gateway_payment_profile_id
      id
    end

    private

    def address_name(order)
      if SolidusSupport.combined_first_and_last_name_in_address? ||
          order.ship_address.respond_to?(:name)
        order.ship_address&.name
      elsif order.ship_address.respond_to?(:full_name)
        order.ship_address&.full_name
      else
        [order.ship_address&.firstname, order.ship_address&.lastname].join(' ')
      end
    end

    def payload(order)
      {
        currency: 'MXN',
        customer_info: {
          name: address_name(order),
          email: order.email,
          phone: order.ship_address&.phone
        },
        charges: [
          {
            payment_method: {
              type: 'oxxo_cash'
            }
          }
        ],
        line_items: order_line_items(order),
        shipping_lines: shipping_lines(order),
        shipping_contact: {
          address: {
            street1: order.ship_address&.address1,
            postal_code: order.ship_address&.zipcode,
            country: 'MX'
          }
        }
      }
    end

    def order_line_items(order)
      order.line_items.map do |li|
        {
          name: li.product.name,
          unit_price: (li.price * 100).to_i,
          quantity: li.quantity
        }
      end
    end

    def parse_response(response)
      {
        authorization: response.charges.first&.payment_method&.reference,
        conekta_order_id: response.id
      }
    end

    def shipping_lines(order)
      order.shipments.map do |s|
        {
          id: s.id,
          carrier: s.shipping_method.name,
          amount: (s.cost * 100).to_i
        }
      end
    end
  end
end
