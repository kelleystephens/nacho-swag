class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    @items = Item.where(user: @user)
    @rented_items = RentedItem.where(user: @user)
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "Email successfully added."
      redirect_to dashboard_path
    else
      flash.alert = "Your email could not be added."
      render :edit
    end
  end

  def show
    @user = current_user
  end

  protected

  def user_params
    params.require(:user).permit(:email)
  end
end
