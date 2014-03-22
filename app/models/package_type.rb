class PackageType < ActiveRecord::Base
  has_many :invoices
  has_many :payments

  def remaining
    total_spots - invoices.count
  end
end
