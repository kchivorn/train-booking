require 'csv'

TICKET_NUMBERS = 3

namespace :seed_timetable do
  desc 'Generate train timetables and save into table departures'

  task run: :environment do
    CSV.foreach(Rails.root.join('lib/train_timetable.csv'), headers: true) do |row|
      Departure.create!(row.to_hash)
    end
  end
end

namespace :top_users do
  desc 'Fetch users who bought more than three tickets'

  task run: :environment do
    users = Ticket.includes(:user)
                  .select('user_id, count(id) as total')
                  .group('user_id')
                  .having('count(id) > ?', TICKET_NUMBERS)
                  .map(&:user)
                  .map(&:email)

    puts users
  end
end

namespace :different_ip do
  desc 'Fetch users who have ever bought a ticket from an IP address other than the one they used to sign up'

  task run: :environment do
    users = User.joins(:tickets)
                .where('tickets.ip_address != users.ip_address')
                .map(&:email)

    puts users
  end
end
