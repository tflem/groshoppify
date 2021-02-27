# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

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

  def show; end

  def edit; end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Product information has been updated.'
      redirect_to @product
    else
      flash.now[:alert] = 'Product information has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @product.destroy

    flash[:notice] = 'Product has been deleted.'
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The product you are looking for does not exist.'
    redirect_to products_path
  end

  def product_params
    params.require(:product).permit(:name, :description, :quantity)
  end
end
