class Invoice < ActiveRecord::Base
	has_many :invoice_items
	belongs_to :job
end
