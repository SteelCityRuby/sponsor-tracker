class Invoice < ActiveRecord::Base
  belongs_to :sponsor
  belongs_to :package_type

  validates_presence_of :sponsor, :package_type
  validates_uniqueness_of :sponsor

  def total
    package_type.price
  end

  def addons_allowed?
    package_type.addons_allowed?
  end
end
