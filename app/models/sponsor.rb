class Sponsor < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, within: 5..40

  state_machine :initial => :prospect do
    event :pledge do
      transition :prospect => :pledged
    end

    event :receive_payment do
      transition :pledged => :payment_processing
    end

    event :reconsile do
      transition :payment_processing => :payment_cleared
    end

    event :upload_assets do
      transition :payment_cleared => :assets_uploaded
    end
  end
end
