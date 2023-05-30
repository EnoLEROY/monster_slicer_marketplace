class RentingsController < ApplicationController
  def new
    @renting = Renting.new
  end

  def create
    @renting = Renting.new(renting_params)
    @renting.user = current_user
    @product = Product.find(params[:product_id])
    @renting.product = @product
    if @renting.save
      redirect_to products_path
    else
      render 'products/show', status: :unprocessable_entity
    end
  end

  private

  def renting_params
    params.require(:renting).permit(:start_date, :end_date)
  end
end
