class InvoiceAddonLineItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :package_addon_type

  validates :invoice, presence: true
  validates :package_addon_type, presence: true, uniqueness: {scope: :invoice}
  validates :quantity, presence: true, numericality: {greater_than: 0}

  def price
    quantity * package_addon_type.price
  end
end
