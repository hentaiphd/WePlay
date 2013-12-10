class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :events, :join_table => "events_users", :class_name => "Event"

  def full_name
    return self.first_name + " " + self.last_name
  end
end
