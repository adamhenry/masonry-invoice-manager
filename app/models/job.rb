class Job < ActiveRecord::Base
	has_many :invoices, :dependent => :destroy

  def can_delete?
    true
  end

end
