class Payment < ActiveRecord::Base
  validates :payment_type, :invoice, presence: true
  validates :ammount, numericality: {greater_than: 0}

  belongs_to :invoice
  belongs_to :payment_type
  belongs_to :created_by, class_name: User
end
