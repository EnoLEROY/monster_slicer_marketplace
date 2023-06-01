class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @search_product = Product.new
    if params[:search][:search_query].present?
      @products_temp = Product.search_title_and_description(params[:search][:search_query])
    else
      @products_temp = Product.all
    end
    if params[:search][:query].present?
      @products = @products_temp.map do |product|
        product if product.category == params[:search][:query]
      end
    else
      @products = @products_temp
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
