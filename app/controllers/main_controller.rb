class MainController < ApplicationController
  # skip_before_action :set_current_user, only: %i[index]

  def index
    @departures = Departure.available
                           .paginate(page: params[:page], per_page: 10)
  end
end
