class Payment < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :payment_type
  belongs_to :created_by
end
