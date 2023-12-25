# app/models/meeting.rb
class Meeting < ApplicationRecord  
  belongs_to :created_by, class_name: 'User', foreign_key: 'user_id', optional: true
end
  