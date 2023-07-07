class Public::UsersController < ApplicationController
  before_action :reject_guest_user, only: [:edit, :update]
  
  def show
    @shops = current_user.shops
  end

  def edit
  end

  def update
  end

  private
  def reject_guest_user
    if current_user.email == ENV['GUEST_USER_EMAIL']
      redirect_to request.referer, notice: "ゲストユーザはご利用いただけません。"
    end
  end
end
