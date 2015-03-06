class ProductsController < ApplicationController
  include Editable

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to product_path(id: @product.id)
    else
      flash_errors
      render 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end

  def update 
    @product = Product.find(params[:id])

    if @product.save
      redirect_to product_path(id: @product.id)
    else
      flash_errors
      render 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
  end

  private
    def product_params
      params.require(:product).permit(:manufacturer, :model, :size, :description, :gender, :image)
    end
end
