class Public::ShopsController < ApplicationController
  def new
    @new_shop = Shop.new
  end

  def create
    @new_shop = Shop.new(shop_params)
    @new_shop.geocode
    if @new_shop.save
      redirect_to public_shop_path(@new_shop)
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
    gon.shop = @shop
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :introduction, :address, :latitude, :longitude)
  end
end
