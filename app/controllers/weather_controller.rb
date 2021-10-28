class WeatherController < ApplicationController
  def index
    @presenter = TemperaturePresenter.new(postcode: nil)
  end

  def search
    @presenter = TemperaturePresenter.new(postcode: params[:query])
    render action: :index
  end
end
