class Departure < ApplicationRecord
  LATE_TIME_START = 22
  LATE_TIME_END = 6

  has_many :tickets

  scope :available, -> { where('departure_time > ? and seats_available > 0', 2.hours.from_now) }

  def late
    local_time = arrival_time.localtime - arrival_time.localtime.at_beginning_of_day

    local_time >= LATE_TIME_START.hours || local_time <= LATE_TIME_END.hours
  end

  def cost_in_dollars
    format('%.2f', (cost_in_cents / 100.0))
  end
end
