class TicketsController < ApplicationController
  def create
    params[:ip_address] = client_ip
    ticket = Current.user.tickets.new(ticket_params)
    if ticket.save
      redirect_to root_path, notice: 'Booked ticket successfully.'
    else
      flash[:alert] = 'Booking is failed. Please try again!'
      redirect_to root_path
    end
  end

  private

  def ticket_params
    params.permit(:departure_id, :ip_address)
  end
end
