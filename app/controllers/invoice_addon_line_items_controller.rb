class InvoiceAddonLineItemsController < ApplicationController
  before_action :set_invoice_addon_line_item, only: [:show, :edit, :update, :destroy]

  # GET /invoice_addon_line_items
  # GET /invoice_addon_line_items.json
  def index
    @invoice_addon_line_items = InvoiceAddonLineItem.all
  end

  # GET /invoice_addon_line_items/1
  # GET /invoice_addon_line_items/1.json
  def show
  end

  # GET /invoice_addon_line_items/new
  def new
    @invoice_addon_line_item = InvoiceAddonLineItem.new invoice: Invoice.find_by_id(params[:invoice_id])
  end

  # GET /invoice_addon_line_items/1/edit
  def edit
  end

  # POST /invoice_addon_line_items
  # POST /invoice_addon_line_items.json
  def create
    @invoice_addon_line_item = InvoiceAddonLineItem.new(invoice_addon_line_item_params)

    respond_to do |format|
      if @invoice_addon_line_item.save
        format.html { redirect_to @invoice_addon_line_item.invoice, notice: 'Invoice addon line item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invoice_addon_line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoice_addon_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_addon_line_items/1
  # PATCH/PUT /invoice_addon_line_items/1.json
  def update
    respond_to do |format|
      if @invoice_addon_line_item.update(invoice_addon_line_item_params)
        format.html { redirect_to @invoice_addon_line_item.invoice, notice: 'Invoice addon line item was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @invoice_addon_line_item }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoice_addon_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_addon_line_items/1
  # DELETE /invoice_addon_line_items/1.json
  def destroy
    @invoice_addon_line_item.destroy
    respond_to do |format|
      format.html { redirect_to invoice_addon_line_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_addon_line_item
      @invoice_addon_line_item = InvoiceAddonLineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_addon_line_item_params
      params.require(:invoice_addon_line_item).permit(:invoice_id, :package_addon_type_id, :quantity)
    end
end
