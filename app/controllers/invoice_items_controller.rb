class InvoiceItemsController < ApplicationController
  # GET /invoice_items
  # GET /invoice_items.xml
  def index
    @invoice_items = InvoiceItem.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoice_items }
    end
  end

  # GET /invoice_items/1
  # GET /invoice_items/1.xml
  def show
    @invoice_item = InvoiceItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice_item }
    end
  end

  # GET /invoice_items/new
  # GET /invoice_items/new.xml
  def new
    @invoice_item = InvoiceItem.new( :invoice_id => params[:id] )
    @invoices = Invoice.find(:all).map{ |i| [ i.invoice_number.to_s + " :" + i.job.name, i.id ] }
    @types = {
       "Labor" => "Labor",
       "Materials" => "Materials",
       "Equipment" => "Equipment",
       "Fee" => "Fee",
       "Credit" => "Credit",
    }
    if( !@invoice_item.invoice.nil? && @invoice_item.invoice.current_status != "Open")
      flash[:notice] = 'Can only create new invoice items on \'Open\' invoices.'
      redirect_to(@invoice_item.invoice)
    else
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @invoice_item }
      end
    end
  end

  # GET /invoice_items/1/edit
  def edit
    @invoice_item = InvoiceItem.find(params[:id])
    @types = {
       "Labor" => "Labor",
       "Materials" => "Materials",
       "Equipment" => "Equipment",
       "Fee" => "Fee",
       "Credit" => "Credit",
    }
    if( @invoice_item.invoice.current_status != "Open")
      flash[:notice] = 'Can only edit invoice items of \'Open\' invoices.'
      redirect_to(@invoice_item)
    end
  end

  # POST /invoice_items
  # POST /invoice_items.xml
  def create
    @invoice_item = InvoiceItem.new(params[:invoice_item])

    respond_to do |format|
      if @invoice_item.save
        flash[:notice] = 'InvoiceItem was successfully created.'
        format.html { redirect_to(@invoice_item) }
        format.xml  { render :xml => @invoice_item, :status => :created, :location => @invoice_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoice_items/1
  # PUT /invoice_items/1.xml
  def update
    @invoice_item = InvoiceItem.find(params[:id])

    respond_to do |format|
      if @invoice_item.update_attributes(params[:invoice_item])
        flash[:notice] = 'InvoiceItem was successfully updated.'
        format.html { redirect_to(@invoice_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_items/1
  # DELETE /invoice_items/1.xml
  def destroy
    @invoice_item = InvoiceItem.find(params[:id])
    return_to = @invoice_item.invoice
    if( @invoice_item.invoice.can_delete?)
      @invoice_item.destroy
    else
      flash[:notice] = 'Can only destroy invoice items of \'Open\' invoices.'
    end

    respond_to do |format|
      format.html { redirect_to(request().referer || invoice_items_url) }
      format.xml  { head :ok }
    end
  end
end
