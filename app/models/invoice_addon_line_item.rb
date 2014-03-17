class InvoiceAddonLineItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :package_addon_type

  validates_presence_of :invoice
  validates_presence_of :package_addon_type
  validates_uniqueness_of :package_addon_type, scope: :invoice

  def price
    quantity * package_addon_type.price
  end
end
