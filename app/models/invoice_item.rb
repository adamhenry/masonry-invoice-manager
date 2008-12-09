class InvoiceItem < ActiveRecord::Base
	belongs_to :invoice
  
  def total
    if( self.amount )
      self.amount
    else
      self.rate * self.quantity
    end
  end
end
