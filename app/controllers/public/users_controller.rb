class Public::UsersController < ApplicationController
  def show
    @shops = current_user.shops
  end

  def edit
  end

  def update
  end
end
