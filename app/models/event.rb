class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_many :users
  has_many :attendees
  validates :user_id, presence: true

  def add_current_user(user)
    self.user_id = user.id
  end
end
