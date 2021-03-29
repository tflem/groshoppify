class Admin::ProductsController < Admin::ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = 'Product information has been created.'
      redirect_to @product
    else
      flash.now[:alert] = 'Product information has not been created.'
      render 'new'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash[:notice] = 'Product has been deleted.'
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :quantity)
  end
end
