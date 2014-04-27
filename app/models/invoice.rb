class Invoice < ActiveRecord::Base
  belongs_to :sponsor
  belongs_to :package_type
  has_many :invoice_addon_line_items
  has_many :payments

  validates :package_type, presence: true
  validates :sponsor, presence: true, uniqueness: true

  default_scope { includes(:payments, :package_type, :sponsor, invoice_addon_line_items: [:package_addon_type]) }

  def total
    package_type.price + (invoice_addon_line_items.map &:price).sum
  end

  def addons_allowed?
    package_type.addons_allowed?
  end

  def name
    "#{Rails.application.local_settings[:invoice_prefix]}-#{id}"
  end

  def total_payments
    payments.sum :amount
  end

  def balance
    total - total_payments
  end
end
