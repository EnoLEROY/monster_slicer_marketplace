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

  def accept
    @renting = Renting.find(params[:id])
    @renting.status = "Accepted"
    @renting.save
    respond_to do |format|
      format.js {render inline: "location.reload();" } # ça fait RIEN
      format.json
    end

  end

  def deny
    @renting = Renting.find(params[:id])
    @renting.status = "Denied"
    @renting.save
    respond_to do |format|
      format.json
    end
  end

  private

  def renting_params
    params.require(:renting).permit(:start_date, :end_date)
  end


end
