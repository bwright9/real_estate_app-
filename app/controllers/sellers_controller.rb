class SellersController < ApplicationController
   before_action :seller, except: [:index, :new, :create] 

  def index
    @sellers = Seller.all.by_name
  end

  def show
  end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      flash[:success] = "seller with name: #{@seller.name} created!"
      redirect_to seller_path(@seller)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @seller.update(seller_params)
      flash[:success] = "seller with name: #{@seller.name} updated!"
      redirect_to seller_path(@seller)
    else
      render :edit
    end
  end

  def destroy
    seller_name = @seller.name
    @seller.destroy
    flash[:success] = "seller with name: #{seller_name} removed!"
    redirect_to sellers_path
  end

  private

    def seller_params
      params.require(:seller).permit(:name, :phone, :email)
    end

    def seller
      @seller = Seller.find(params[:id])
    end
end
