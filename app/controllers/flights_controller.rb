class FlightsController < ApplicationController
  def index
    @airport = Airport.all
    @available_dates = Flight.pluck(:departure_time).map { |dt| dt.to_date }.uniq.sort
    @flight = []

    if params[:departure_airport_id].present? &&
       params[:arrival_airport_id].present? &&
       params[:search].present? && params[:search][:date].present?

      date = Date.parse(params[:search][:date])

      @flights = Flight.where(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id: params[:arrival_airport_id]
      ).where("DATE(departure_time) = ?", date)
    end
  end
end
