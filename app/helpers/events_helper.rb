module EventsHelper
  def except_current_user
    current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id])
  end
end
