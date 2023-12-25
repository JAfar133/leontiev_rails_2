# app/models/meeting.rb
class Meeting < ApplicationRecord  
  belongs_to :created_by, class_name: 'User', foreign_key: 'user_id', optional: true
  has_many :user_meetings
  has_many :users, through: :user_meetings

  validates :datetime, presence: true
end
  