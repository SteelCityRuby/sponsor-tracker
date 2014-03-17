class CreatePackageTypes < ActiveRecord::Migration
  def change
    create_table :package_types do |t|
      t.string :name
      t.integer :price
      t.boolean :addons_allowed
      t.integer :tickets
      t.integer :total_spots

      t.timestamps
    end
  end
end
