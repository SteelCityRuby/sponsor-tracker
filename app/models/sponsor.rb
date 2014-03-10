class Sponsor < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, within: 5..40
end
