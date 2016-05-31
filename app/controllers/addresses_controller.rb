class AddressesController < ApplicationController
   def index
  	@home = Home.find(params[:home_id])
    @addresses = Address.all
  end

  def show
  	@home = Home.find(params[:home_id])
  	@address = Address.find(params[:id])
  end

  def new
  	@home = Home.find(params[:home_id])
  	@address = Address.new
  end

  def create
  	@home = Home.find(params[:address][:home_id])
  	@address = @home.addresses.new(address_params)
  	if @address.save
      flash.now[:success] = "Address Added Successfully"
  		redirect_to address_path(id: @address.id, home_id: @home.id)
  	else
      flash.now[:danger] = @address.errors.full_messages.join('<br/>').html_safe
  		render :new
  	end
  end

  def edit
  	@home = Home.find(params[:home_id])
  	@address = Address.find(params[:id])
  end

  def update
    @home = Home.find(params[:address][:home_id])
  	@address = Address.find(params[:id])
  	if @address.update(address_params)
  		redirect_to address_path(id: @address.id, home_id: @home.id)
  	else
  		render :edit
  	end
  end

  def destroy
  	Address.find(params[:id]).destroy
  	redirect_to addresses_path
  end

  private

  def address_params
  	params.require(:address).permit(:street, :city, :state, :zip, :home_id)
  end
end
