class HomesController < ApplicationController
  before_action :seller
  before_action :home, only: [:show, :edit, :update, :destroy]

  def index
    @homes = @seller.homes
  end

  def show
  end

  def new
    @home = Home.new
  end

  def create
    @home = @seller.homes.new(home_params)
    if @home.save
      flash[:success] = "Home created!"
      redirect_to seller_home_path(@seller, @home)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @home.update(home_params)
      flash[:success] = "Home updated!"
      redirect_to seller_home_path(@seller, @home)
    else
      render :edit
    end
  end

  def destroy
    name = @home.name
    @home.destroy
    flash[:success] = "home with name #{name} destroyed!"
    redirect_to seller_homes_path(@seller)
  end

  private
  
  def home_params
    params.require(:home).permit(:name, :square_feet, :beds, 
                                       :baths, :home_type, :price, :active)                                  :active)
  end
  def home
    @home = @seller.homes.find(params[:id])
  end
  def seller
    @seller = Seller.find(params[:seller_id])
  end
end
