class PrintController < ApplicationController
	
	def invoice

    @invoice = Invoice.find( params[:id] )
    @items = {}
    @invoice.invoice_items.each { |i| ( @items[i.item_type] ||= [] ) << i }

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoice_items }
    end
  end

end
