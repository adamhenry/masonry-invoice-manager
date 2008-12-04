class Job < ActiveRecord::Base
	has_many :invoices
end
