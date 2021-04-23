require 'csv'

TICKET_NUMBERS = 3

namespace :timetable do
  task create_train_timetable: :environment do
    CSV.foreach(Rails.root.join('lib/train_timetable.csv'), headers: true) do |row|
      Departure.create!(row.to_hash)
    end
  end

  task users_with_more_than_three_tickets: :environment do
    users = Ticket.includes(:user)
                  .select('user_id, count(id) as total')
                  .group('user_id')
                  .having('count(id) > ?', TICKET_NUMBERS)
                  .map(&:user)
                  .map(&:email)

    puts users
  end

  task users_bought_with_different_ip_address: :environment do
    users = User.joins(:tickets)
                .where('tickets.ip_address != users.ip_address')
                .map(&:email)

    puts users
  end
end
