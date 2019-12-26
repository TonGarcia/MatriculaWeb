class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable, #:confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable, :omniauthable

  # TheRole gem included
  include TheRole::Api::User
  include EmailValidator

  # Relations
  has_many :researchers
  # has_one :profile, foreign_key: :created_by, primary_key: :id, class_name: 'Researcher'
  # has_many :experiences, through: :profile
  # has_many :degrees, through: :profile

  # Validations
  validates :name, length: { minimum: 8, maximum: 45 }, presence: true, on: [:create, :update]
  validates :locale, length: { is: 5 }, presence: true, on: [:create, :update]
  validates :email, email: true, presence: true, on: [:create, :update]
  validates_presence_of :role_id

  # Check if it is a moderator user role
  def moderator?
    self.role.name == 'moderator'
  end

  # # Check if it user has a profile
  def has_profile?
    !(self.admin? || self.moderator?) && self.profile
  end

  # Get foreign profile id
  def profile_id
     has_profile? ? self.profile.id : nil
  end
end
