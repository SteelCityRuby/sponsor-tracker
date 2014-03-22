class PackageType < ActiveRecord::Base
  has_many :invoices
  has_many :payments

  validates :name, presence: true
  validates :price, :total_spots, presence: true, numericality: {greater_than: 0}
  validates :tickets, presence: true, numericality: true

  def remaining
    total_spots - invoices.count
  end
end
