class Invoice < ActiveRecord::Base
	has_many :invoice_items
	has_many :payments
	belongs_to :job

  validates_presence_of :job, :status
  validates_numericality_of :invoice_number

  private
  def validates
    add.error(:date, "is required for invoiced invoices.") if date.nil? && status == "Invoiced"
  end

  public
  def invoice_item_total 
    self.invoice_items.inject(0) { |total, i| total += i.total }
  end

  def payment_total 
    self.payments.inject(0) { |total, p| total += p.total }
  end

  def invoice_total
    invoice_item_total - payment_total
  end

  def current_status
    if( self.status == "invoiced" && ( self.date_due - Time.now >= 30.days ) )
      "Late"
    else
      self.status
    end
  end

end
