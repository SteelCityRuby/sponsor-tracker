class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :sponsor, index: true
      t.references :package_type, index: true

      t.timestamps
    end
  end
end
