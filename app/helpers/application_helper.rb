module ApplicationHelper
  def format_time(datetime)
    datetime.strftime('%Y-%m-%d %H:%M')
  end
end
