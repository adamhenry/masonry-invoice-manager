module InvoicesHelper
	def format_amount amount
		if amount < 0
			return "$(" + amount.abs.to_s + ")"
		else
			return "$" + amount.abs.to_s
		end
	end
  
  def render_action_button tag, obj
      render :partial => "invoices/action_button", :locals => { :tag => tag, :obj => obj }
  end

  def render_link_to_confirm tag, method, obj
    link_to tag, obj, :confirm => 'Are you sure?', :method => method
  end

  def render_invoice_link_to_confirm obj
    link_to 'Invoice', '/invoices/invoice/' + obj.id.to_s if obj.can_invoice?
  end

  def render_delete_link_to_confirm obj
    render_link_to_confirm 'Delete', :delete, obj if obj.can_delete?
  end

  def render_close_action_button obj
    render_action_button "Close", obj if obj.can_close?
  end

  def render_cancel_action_button obj
    render_action_button "Cancel", obj if obj.can_cancel?
  end

  def render_invoice_action_buttons invoice
    html = ""
    html += ( render_invoice_link_to_confirm(invoice) || "" )
    html += ( render_delete_link_to_confirm(invoice)  || "" )
    html += ( render_close_action_button(invoice)     || "" )
    html += ( render_cancel_action_button(invoice)    || "" )
  end

  def invoice_types
    [
      [ "Open", "Open" ],
      [ "Invoiced", "Invoiced" ],
      [ "Closed", "Closed" ],
      [ "Canceled", "Canceled" ]
    ]
  end

  
end
