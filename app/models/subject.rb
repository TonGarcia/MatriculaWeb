class Subject < ApplicationRecord
  belongs_to :user
  belongs_to :structural_axes, class_name: 'KnowledgeArea', primary_key: :structural_axes_id
  belongs_to :sub_knowledge_area, class_name: 'KnowledgeArea', primary_key: :sub_knowledge_area_id
  belongs_to :super_knowledge_area, class_name: 'KnowledgeArea', primary_key: :super_knowledge_area_id
end
