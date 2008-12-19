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
    if( self.status == "Invoiced" &&
        !self.due_date.nil? &&
        ( self.due_date + 30.days < Date.today ) )
      "Late"
    else
      self.status.to_s
    end
  end

  def can_invoice?
    return false if self.nil? || self.status.nil?
    ["Open"].include? self.status
  end

  def can_close?
    return false if self.nil? || self.status.nil?
    ["Invoiced"].include? self.status
  end

  def can_cancel?
    return false if self.nil? || self.status.nil?
    ["Invoiced", "Closed"].include? self.status
  end

  def can_delete?
    return false if self.nil? || self.status.nil?
    ["Open"].include? self.status
  end

end
