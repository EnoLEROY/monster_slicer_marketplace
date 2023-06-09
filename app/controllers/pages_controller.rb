class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @rentings = Renting.where(user_id: current_user)
    @user_products = Product.where(user_id: current_user)
  end
end
