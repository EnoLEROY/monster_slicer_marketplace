class ProductsController < ApplicationController
  before_action :set_products, only: [:index]

  def index
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def set_products
    @products = Product.all
  end

  def params_product
    params.require(:product).permit(:title, :description, :price, :category)
  end

end
