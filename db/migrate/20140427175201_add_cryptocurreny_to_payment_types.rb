class AddCryptocurrencyToPaymentTypes < ActiveRecord::Migration
  def change
    PaymentType.create name: "Cryptocurrency"
  end
end
