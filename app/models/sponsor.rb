class Sponsor < ActiveRecord::Base
  has_one :invoice

  validates :name, presence: true, length: {within: 5..40}

  state_machine :initial => :prospect do
    event :pledge do
      transition :prospect => :invoiced
    end

    event :receive_check do
      transition :invoiced => :payment_processing
    end

    event :deposit_check do
      transition :payment_processing => :payment_received
    end

    event :swipe_credit_card do
      transition :invoiced => :payment_received
    end

    event :upload_assets do
      transition :payment_received => :assets_uploaded
    end
  end

  def balance
    invoice.balance if invoice
  end
end
