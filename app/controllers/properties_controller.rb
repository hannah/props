class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end
  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to @property, notice: 'New Property Created'
    else
      render 'new'
    end
  end

  private
  def property_params
    params.require(:property).permit(:street_address, :city, :state, :zip_code, :user_id)
  end
end
