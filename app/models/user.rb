class User < ApplicationRecord
  after_initialize :set_default_role, if: :new_record?
  
  has_many :created_meetings, foreign_key: 'created_by', class_name: 'Meeting', dependent: :destroy

  has_many :user_meetings
  has_many :meetings, through: :user_meetings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { maximum: 100 }
  validates :last_name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 150 }, format: { with: URI::MailTo::EMAIL_REGEXP }

  def organizator?
    self.role == 'organizator'
  end

  def join_to_meetings(meeting)
    user_meetings.create(meeting: meeting)
  end

  def leave_from_meetings(meeting)
    user_meetings.find_by(meeting: meeting)&.destroy
  end

  def user_meetings?(meeting)
    user_meetings.exists?(meeting: meeting)
  end
  
  private

  def set_default_role
    self.role ||= 'user'
  end
end
