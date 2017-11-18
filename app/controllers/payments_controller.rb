class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
  end
  def new
    @invoice = Invoice.find(params[:invoice_id])
    @payment = @invoice.build_payment
  end

  def create
   @invoice = Invoice.find(params[:invoice_id])
   @payment = @invoice.build_payment(payment_params)
    respond_to do |format|
      if @payment.save
        format.html { redirect_to invoice_payment_path(:invoice_id => @invoice.id, :id => @payment.id), notice: 'payment was  successfully created.' }
        #format.json { render json: @payment, status: :created, payment: @payment }
      else
        format.html { render action: "new" }
        #format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    @payment = Payment.find(params[:id])
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:invoice_id])
    @payment = @invoice.payment
    respond_to do |format|
      if @invoice.payment.update(payment_params)
        format.html { redirect_to invoice_payment_path(:invoice_id => @invoice.id, :id => @invoice.payment.id), notice: 'payment was  successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  private
  def payment_params
    params.require(:payment).permit(:amount, :date, :invoice_id)
  end
end
