class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to product_path(id: @product.id)
    else
      flash_errors(@product)
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
      flash_errors(@product)
      render 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
  end

  private
    def product_params
      params.require(:product).permit(:name)
    end
end
