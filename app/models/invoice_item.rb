class InvoiceItem < ActiveRecord::Base
	belongs_to :invoice
  
  def total
    if( self.amount )
      self.amount
    else
      ( self.rate ||= 0 ) * ( self.quantity ||= 0 )
    end
  end

end
