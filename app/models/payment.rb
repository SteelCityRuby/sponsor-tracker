class Payment < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :payment_type
  belongs_to :created_by, class_name: User

  delegate :sponsor, to: :invoice

  validates :payment_type, :invoice, presence: true
  validates :amount, numericality: {greater_than: 0}
end
