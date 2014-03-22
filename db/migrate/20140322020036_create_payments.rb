class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :invoice, index: true
      t.belongs_to :payment_type, index: true
      t.integer :ammount
      t.references :created_by, index: true

      t.timestamps
    end
  end
end
