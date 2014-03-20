class AddAddressToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :address, :text
  end
end
