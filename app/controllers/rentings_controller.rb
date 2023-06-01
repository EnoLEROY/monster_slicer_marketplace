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
      redirect_to dashboard_path
    else
      render 'products/show', status: :unprocessable_entity
    end
  end

  def destroy
    @renting = Renting.find(params[:id])
    @renting.destroy
  end

  private

  def renting_params
    params.require(:renting).permit(:start_date, :end_date)
  end


end
