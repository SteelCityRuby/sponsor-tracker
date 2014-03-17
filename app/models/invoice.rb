class Invoice < ActiveRecord::Base
  belongs_to :sponsor
  belongs_to :package_type
end
