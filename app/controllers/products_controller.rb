class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @products = Product.where(category: params[:query])
    else
      @products = Product.all
    end
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

  def details
    @product = Product.find(params[:id])
  end

  private

  def set_products
    @products = Product.all
  end

  def params_product
    params.require(:product).permit(:title, :description, :price, :category, :product_image)
  end
end
