class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to cars_path
      flash[:notice] = "This Car has been created successfully"
    else
      render 'new'
    end
  end

  private

  def car_params
    params.require(:car).permit(:color, :year, :mileage, :description, :manufacturer_id)
  end
end
