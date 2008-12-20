class InvoiceItem < ActiveRecord::Base
	belongs_to :invoice
  
  validates_presence_of :description, :item_type
  validates_numericality_of :amount, :allow_nil => true
  validates_numericality_of :rate, :allow_nil => true
  validates_numericality_of :quantity, :allow_nil => true, :only_integer => true, :message => "must be a number"

  protected
  def number? var
    var.type == :integer || var.type == :float || var.type == :decimal
  end

  def validate
    errors.add(:amount,"can not be included with rate or quantity.") if !amount.nil? && ( !rate.nil? || !quantity.nil?)
    if !rate.nil? && quantity.nil?
      errors.add(:quantity,"must be included with rate")
    end
    if rate.nil? && !quantity.nil?
      errors.add(:rate,"must be included with quantity")
    end
    if amount.nil? && rate.nil? && quantity.nil?
      errors.add(:amount,"or rate and quantity must be specified")
    end
  end

  public
  def total
    if( self.amount )
      self.amount
    else
      ( self.rate ||= 0 ) * ( self.quantity ||= 0 )
    end
  end
  
  def can_delete?
    self.invoice.can_delete?
  end

end
