class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  #before_save :add_current_user
  validates :user_id, presence: true

  def add_current_user(user)
    self.user_id = user.id
  end
end
