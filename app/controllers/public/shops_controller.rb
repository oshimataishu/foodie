class Public::ShopsController < ApplicationController
  def new
    @new_shop = Shop.new
  end

  def create
    @new_shop = Shop.new(shop_params)
    @new_shop.geocode
    @new_shop.user_id = current_user.id
    if @new_shop.save
      redirect_to shop_path(@new_shop)
    else
      render :new
    end
  end

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    gon.shop = @shop
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shops_path
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :introduction, :address, :latitude, :longitude)
  end
end
