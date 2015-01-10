class SalesController < ApplicationController
  respond_to :html

  def new
    @sale = Sale.new
    @product = Product.find params[:product]
    @sale.product_id = @product.id
    respond_with(@sale)
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      CrmWorker.perform_async(sale_params)
      redirect_to products_path
    else
      render 'new'
    end
  end

  private
    def sale_params
      params.require(:sale).permit(:first_name, :last_name, :email, :product_id, :address, :zipcode, :country)
    end
end
