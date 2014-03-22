class PaymentType < ActiveRecord::Base
  validates :name, presence: true
end
