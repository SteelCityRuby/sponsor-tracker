class PackageType < ActiveRecord::Base
  has_many :invoices

  def remaining
    total_spots - invoices.count
  end
end
