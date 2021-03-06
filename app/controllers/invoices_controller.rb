class InvoicesController < ApplicationController
  # GET /invoices
  # GET /invoices.xml
  def index
    @invoices = Invoice.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.xml
  def show
    @invoice = Invoice.find(params[:id])
    @payments = {}
    @invoice.payments.each { |p| ( @payments[p.payment_type] ||= [] ) << p }

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
    end
  end

  # GET /invoices/print/1
  # GET /invoices/print/1.xml
  def print
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.xml
  def new
    @invoice = Invoice.new(
      :job_id => params[:id],
      :status => "Open",
      :invoice_number => ( Invoice.all.map{ |i| i.invoice_number }.sort.reverse[0] ||= 0).to_i + 1
    )
    if @invoice.job.nil?
      @jobs_array = Job.all.map{ |j| [ j.name, j.id ] }
    end

    #raise @invoice.inspect
    #raise @jobs_array.inspect

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
    #if( @invoice.current_status != "Open")
      #flash[:notice] = 'Can only edit \'Open\' invoices.'
      #redirect_to(@invoice)
    #end
  end

  # POST /invoices
  # POST /invoices.xml
  def create
    @invoice = Invoice.new(params[:invoice])

    respond_to do |format|
      if @invoice.save
        flash[:notice] = 'Invoice was successfully created.'
        format.html { redirect_to(@invoice) }
        format.xml  { render :xml => @invoice, :status => :created, :location => @invoice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.xml
  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        flash[:notice] = 'Invoice was successfully updated.'
        format.html { redirect_to(@invoice) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.xml
  def destroy
    @invoice = Invoice.find(params[:id])
    if( @invoice.status == "Open" )
      @invoice.destroy
    else
      flash[:notice] = 'Cannot Destroy Invoices that are not open'
    end

    respond_to do |format|
      format.html { redirect_to(request().referer || invoices_url) }
      format.xml  { head :ok }
    end
  end

  # PUT /invoices/invoice/1
  def invoice
    @invoice = Invoice.find(params[:id])
    @invoice.status = "Invoiced"
  end

end
