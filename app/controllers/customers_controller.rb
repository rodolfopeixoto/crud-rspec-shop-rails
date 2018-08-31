class CustomersController < ApplicationController
  def index
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

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :smoler, :phone, :avatar)
  end

end