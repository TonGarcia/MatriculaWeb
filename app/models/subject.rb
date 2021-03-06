<<<<<<< HEAD
class Subject < ApplicationRecord
  belongs_to :user
  belongs_to :knowledge_area
  has_many :subscriptions
  #belongs_to :structural_axes, class_name: 'KnowledgeArea', primary_key: :structural_axes_id
  #belongs_to :sub_knowledge_area, class_name: 'KnowledgeArea', primary_key: :sub_knowledge_area_id
  #belongs_to :super_knowledge_area, class_name: 'KnowledgeArea', primary_key: :super_knowledge_area_id

  def subscriber?(user)
    !Subscription.where(user_id: user.id, subject_id: self.id).take.nil?
  end

  def calc_workload
    self.class_schedule.scan(/(?=#{1})/).count
  end
end
=======
class Subject < ApplicationRecord
  belongs_to :user
  belongs_to :knowledge_area
  has_many :subscriptions
  #belongs_to :structural_axes, class_name: 'KnowledgeArea', primary_key: :structural_axes_id
  #belongs_to :sub_knowledge_area, class_name: 'KnowledgeArea', primary_key: :sub_knowledge_area_id
  #belongs_to :super_knowledge_area, class_name: 'KnowledgeArea', primary_key: :super_knowledge_area_id

  def subscriber?(user)
    !Subscription.where(user_id: user.id, subject_id: self.id).take.nil?
  end

  def calc_workload
    self.class_schedule.scan(/(?=#{1})/).count
  end
end
>>>>>>> 34166a1067dc45e0339bcbf35c4f8978d91dd5f3
