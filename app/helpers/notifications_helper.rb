module NotificationsHelper
  def sort_order(column, title)
    direction = params[:direction] == 'asc' ? 'desc' : 'asc'
    link_to title, { sort: column, direction: direction }
  end
end
