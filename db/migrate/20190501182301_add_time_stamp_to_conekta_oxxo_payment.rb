# frozen_string_literal: true

class AddTimeStampToConektaOxxoPayment < SolidusSupport::Migration[4.2]
  def change
    change_table :spree_conekta_oxxo_payments do |t|
      t.timestamps
    end
  end
end
