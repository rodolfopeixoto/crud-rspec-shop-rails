class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customers_path, notice: 'Client create with successsfully!'
    else
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update    
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id), notice:'Client update successfully'
    else
      render :edit
    end

  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :smoler, :phone, :avatar)
  end

end