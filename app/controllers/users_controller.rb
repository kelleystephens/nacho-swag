class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    @items = Item.where(user: @user)
    @rented_items = RentedItem.where(user: @user)
  end
end
