# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_product
  before_action :set_note, only: %i[show edit update destroy]

  def new
    @note = @product.notes.build
  end

  def create
    @note = @product.notes.build(note_params)

    if @note.save
      flash[:notice] = 'Your note has been created.'
      redirect_to [@product, @note]
    else
      flash.now[:alert] = 'Your note has not been created.'
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @note.update(note_params)
      flash[:notice] = 'Your note has been updated.'
      redirect_to [@product, @note]
    else
      flash.now[:alert] = 'Your note has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @note.destroy

    flash[:notice] = 'Your note has been deleted.'
    redirect_to @product
  end

  private

  def note_params
    params.require(:note).permit(:name, :description)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_note
    @note = @product.notes.find(params[:id])
  end
end
