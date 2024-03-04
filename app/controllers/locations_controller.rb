# frozen_string_literal: true

class LocationsController < ApplicationController
  def create
    @location = Location.new(location_params)

    if @location.save
    # Handle the success scenario, possibly redirecting to a 'show' or 'index' page
    else
      # Handle the failure scenario, such as re-rendering the form with errors
    end
  end

  private

  def location_params
    params.require(:location).permit(:country, :state, :city)
  end
end
