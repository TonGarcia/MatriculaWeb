class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  before_save :prevent_duplication
  before_create :prevent_duplication

  attr_accessor :duplicated_association

  def duplicated?
    Subscription.where(user_id: self.user_id, subject_id: self.subject_id).take.nil?
  end

  def self.duplicated?(user_id, subject_id)
    Subscription.where(user_id: user_id, subject_id: subject_id).take.nil?
  end

  def prevent_duplication
    subscription = Subscription.duplicated?(self.attributes['user_id'], self.attributes['subject_id'])
    unless subscription.nil?
      errors.add(:duplicated_association, :blank, message: "true")
    end
  end
end
