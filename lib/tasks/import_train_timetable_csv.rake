require 'csv'

namespace :timetable do
  task create_train_timetable: :environment do
    CSV.foreach(Rails.root.join('lib/train_timetable.csv'), headers: true) do |row|
      Departure.create!(row.to_hash)
    end
  end

  task users_with_more_than_three_tickets: :environment do
    count = Ticket.includes(:user)
                  .select('user_id, count(id) as total')
                  .group('user_id')
                  .having('count(id) > ?', 3)

    puts count.map(&:user).map(&:email)
  end
end
