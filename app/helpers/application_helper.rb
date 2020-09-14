module ApplicationHelper
  def owner?(obj)
    current_user == obj.user 
  end
end
