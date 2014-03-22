class PackageAddonType < ActiveRecord::Base
  has_many :invoice_addon_line_items

  validates :name, presence: true
  validates :price, :total_spots, presence: true, numericality: {greater_than: 0}

  def remaining
    total_spots - (invoice_addon_line_items.map &:quantity).sum
  end
end
