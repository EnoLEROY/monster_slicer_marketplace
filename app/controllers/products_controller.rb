class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @search_product = Product.new
    if params[:search].present? && params[:search][:search_query].present?
      products_temp = Product.search_title_and_description(params[:search][:search_query])
    else
      products_temp = Product.all
    end
    products_temp = filter_product_by_category(products_temp, params)
    @products = filter_product_by_date(products_temp, params)
  end

  def show
    @product = Product.find(params[:id])
    @renting = Renting.new
    @rentings = Renting.where(product_id: @product.id)
    @unavailable_dates = @rentings.map do |renting|
      { from: renting.start_date.strftime("%Y-%m-%d"), to: renting.end_date.strftime("%Y-%m-%d") }
    end
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
    @nb_days = nb_days_rented
    @gold_earned = total_gold_earned
    @current_state_product = current_state
  end

  private

  def set_products
    @products = Product.all
  end

  def params_product
    params.require(:product).permit(:title, :description, :price, :category, :product_image)
  end

  def nb_days_rented
    @product = Product.find(params[:id])
    nb_days = 0
    @product.rentings.each do |renting|
      nb_days += ((renting.end_date - renting.start_date).to_i / (60*60*24) + 1)
    end
    return nb_days
  end

  def total_gold_earned
    @product = Product.find(params[:id])
    amount = 0
    @product.rentings.each do |renting|
      amount += @product.price * ((renting.end_date - renting.start_date).to_i / (60*60*24) + 1)
    end
    return amount
  end

  def current_state
    @product = Product.find(params[:id])
    today = Date.today()
    status = "Free"
    @product.rentings.each do |renting|
      if today >= renting.start_date && today <= renting.end_date
        status = "Booked"
        break
      end
    end
    return status
  end

  def available?(date_range, product)
    is_available = true
    product.rentings.each do |renting|
      if renting.start_date.to_i.between?(date_range[0], date_range[1]) || renting.end_date.to_i.between?(date_range[0], date_range[1])
        is_available = false
      end
    end
    return is_available
  end

  def filter_product_by_category(products, params)
    if params[:search].present? && params[:search][:query].present?
      filtered_products = products.select do |product|
        product if product.category == params[:search][:query]
      end
    else
      filtered_products = products
    end
    return filtered_products
  end

  def filter_product_by_date(products, params)
    if params[:search].present? && params[:search][:opening_date].present? && params[:search][:end_date].present?
      search_opening_date = DateTime.strptime(params[:search][:opening_date], "%Y-%m-%d")
      search_end_date = DateTime.strptime(params[:search][:end_date], "%Y-%m-%d")
      date_range = [search_opening_date.to_i, search_end_date.to_i]
      filtered_products = products.select do |product|
        available?(date_range, product)
      end
    else
      filtered_products = products
    end
    return filtered_products
  end
end
