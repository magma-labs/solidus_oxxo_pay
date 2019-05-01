# frozen_string_literal: true

class CreateConektaOxxoPayments < SolidusSupport::Migration[4.2]
  def change
    create_table :spree_conekta_oxxo_payments do |t|
      t.references :payment_method
      t.string :number
      t.string :conekta_order_id
      t.string :first_name
      t.string :last_name
      t.integer :user_id
    end
  end
end
