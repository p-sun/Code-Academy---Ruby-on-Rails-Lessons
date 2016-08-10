class DestinationsController < ApplicationController

  def show
    @destination = Destination.find(params[:id])
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update_attributes(destination_params) # If updating the object is successful
      redirect_to(:action => 'show', :id => @destination.id) # Open a fresh 'show' page
    else
      render 'edit' # Else, resend the params in the current form, and refresh the current page
    end
  end

  private
  def destination_params
    params.require(:destination).permit(:name, :description)
      # :name and :description are from edit.erb
      # :destination is from the @destination from edit.erb, which is an object from the Destination table
      #   I'm not sure why these are named differently, but refer to the same thing.
      #   Note!!! it's NOT the route :destination from routes.rb
  end

end
