class RenameAmmountToAmountOnPayments < ActiveRecord::Migration
  def change
    change_table :payments do |t|
      t.rename :ammount, :amount
    end
  end
end
