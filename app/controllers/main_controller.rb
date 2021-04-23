class MainController < ApplicationController
  def index
    @departures = Departure.available
                           .paginate(page: params[:page], per_page: 10)
  end
end
