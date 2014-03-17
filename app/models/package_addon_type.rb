class PackageAddonType < ActiveRecord::Base
  has_many :invoice_addon_line_items

  def remaining
    total_spots - (invoice_addon_line_items.map &:quantity).sum
  end
end
