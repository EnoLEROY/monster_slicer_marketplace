class ProductsController < ApplicationController
  before_action :set_products, only: [:index]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  end

  def show
    @product = Product.find(params[:id])
    @renting = Renting.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params_product)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_products
    @products = Product.all
  end

  def params_product
    params.require(:product).permit(:title, :description, :price, :category, :product_image)
  end
end
