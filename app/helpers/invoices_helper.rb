module InvoicesHelper
	def format_amount amount
		if amount < 0
			return "$(" + amount.abs.to_s + ")"
		else
			return "$" + amount.abs.to_s
		end
	end
  
  def invoice_types
    [
      [ "Open", "Open" ],
      [ "Invoiced", "Invoiced" ],
      [ "Closed", "Closed" ],
      [ "Cancled", "Cancled" ]
    ]
  end
  
  def selector_switch
  end

end
