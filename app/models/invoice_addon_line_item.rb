class InvoiceAddonLineItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :package_addon_type

  validates_presence_of :invoice, :package_addon_type, :quantity

  validates_uniqueness_of :package_addon_type, scope: :invoice
  validates_numericality_of :quantity, greater_than: 0

  def price
    quantity * package_addon_type.price
  end
end
