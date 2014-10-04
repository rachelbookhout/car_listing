class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    @cars = Car.all
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to manufacturers_path
      flash[:notice] = "This Manufacturer has been created successfully"
    else
      render 'new'
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
