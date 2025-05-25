class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @available_dates = Flight.pluck(:departure_time).map(&:to_date).uniq.sort

    if params[:departure_airport_id].present? && params[:arrival_airport_id].present? && params[:passengers].present? && params[:search]&.[](:date).present?
      date = Date.parse(params[:search][:date]) rescue nil
      @flights = Flight.where(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id: params[:arrival_airport_id]
      ).select { |flight| flight.departure_time.to_date == date }
    else
      @flights = []
    end
  end
end
