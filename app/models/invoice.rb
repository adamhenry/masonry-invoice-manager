class Invoice < ActiveRecord::Base
	has_many :invoice_items
	has_many :payments
	belongs_to :job
end
