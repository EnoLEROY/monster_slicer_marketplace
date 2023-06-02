class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @rentings = Renting.where(user_id: current_user)
    @user_products = Product.where(user_id: current_user)
  end

  def user_statistics
    @renting = Renting.where(user_id: current_user)
    @user_products = Product.where(user_id: current_user)

    # @data = { weapons: 4, potions: 1 }
    @data = ["weapons 4", "potions 3"]
  end
end
