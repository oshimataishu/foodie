class Public::ShopsController < ApplicationController
  def show
    @shop = Shop.find(params[:id])
    gon.shop = @shop
  end
end
