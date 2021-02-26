# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

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

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      flash[:notice] = 'Product information has been updated.'
      redirect_to @product
    else
      flash.now[:alert] = 'Product information has not been updated.'
      render 'edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :quantity)
  end
end
