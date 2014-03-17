class CreatePackageAddonTypes < ActiveRecord::Migration
  def change
    create_table :package_addon_types do |t|
      t.string :name
      t.integer :price
      t.integer :total_spots

      t.timestamps
    end
  end
end
