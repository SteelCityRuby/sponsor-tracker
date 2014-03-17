class InvoiceAddonLineItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :package_addon_type
end
