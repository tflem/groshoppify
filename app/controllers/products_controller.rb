class ProductsController < ApplicationController
	def index
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

		if @product.save
			flash[:notice] = "Product information has been created."
			redirect_to @product
		else
			#notta dang thang yet
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	private

	def product_params
		params.require(:product).permit(:name, :description, :quantity)
	end
end