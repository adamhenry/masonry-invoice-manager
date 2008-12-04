module InvoicesHelper
	def format_amount amount
		if amount < 0
			return "$(" + amount.abs.to_s + ")"
		else
			return "$" + amount.abs.to_s
		end
	end
end
