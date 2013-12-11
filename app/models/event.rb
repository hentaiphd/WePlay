class Event < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => "events_users", :class_name => "User"
  validates :user_id, presence: true
  has_and_belongs_to_many :games

  def add_current_user(user)
    self.user_id = user.id
  end
end
