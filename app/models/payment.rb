class Payment < ActiveRecord::Base
  belongs_to :invoice
  
  validates_presence_of :payment_type, :employee_name, :invoice, :date
  validates_numericality_of :check

  protected
  def validate
    errors.add(:amount, "should be at least 0.01") if amount.nil? || amount < 0.01
  end
  
  public
  def total
    if( self.payment_type == "credit" )
      -self.amount
    else
      self.amount
    end
  end

  def can_delete?
    true
  end

end
