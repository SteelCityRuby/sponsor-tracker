class CreateInvoiceAddonLineItems < ActiveRecord::Migration
  def change
    create_table :invoice_addon_line_items do |t|
      t.references :invoice, index: true
      t.references :package_addon_type, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
