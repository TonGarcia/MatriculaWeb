class KnowledgeArea < ApplicationRecord
  belongs_to :knowledge_area, optional: true

  def parent_knowledge_area
    if self.knowledge_area.nil?
      KnowledgeArea.new
    else
      self.knowledge_area
    end
  end
end
