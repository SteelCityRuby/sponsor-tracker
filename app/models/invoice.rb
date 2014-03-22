class Invoice < ActiveRecord::Base
  belongs_to :sponsor
  belongs_to :package_type
  has_many :invoice_addon_line_items
  has_many :payments

  validates :package_type, presence: true
  validates :sponsor, presence: true, uniqueness: true

  def total
    package_type.price + (invoice_addon_line_items.map &:price).sum
  end

  def addons_allowed?
    package_type.addons_allowed?
  end

  def name
    "2014-SCRC-#{id}"
  end

  def balance
    total - payments.sum(:ammount)
  end
end
