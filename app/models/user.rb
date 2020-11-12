class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable, :omniauthable

  # TheRole gem included
  include TheRole::Api::User
  include EmailValidator

  # Relations
  has_many :schools
  has_many :subscriptions
  has_many :subjects, through: :subscriptions
  belongs_to :school, class_name: 'School', optional: true

  # Validations
  validates :full_name, length: { minimum: 8, maximum: 45 }, presence: true, on: [:create, :update]
  validates :locale, length: { is: 5 }, presence: true, on: [:create, :update]
  validates :email, email: true, presence: true, on: [:create, :update]
  validates :gov_id, length: { minimum: 6, maximum: 45 }, presence: true, on: [:create, :update]
  validates :school_id, presence: true, on: [:create, :update], unless: :administrative?
  validates_presence_of :role_id

  def administrative?
    self.role = Role.find(self.role_id)
    self.role.admin? || self.role.name == 'moderator'
  end

  def first_name
    self.full_name.split(' ')[0]
  end

  def amount_time_watching
    self.subscriptions.sum(:amount_time_watching)
  end
end
