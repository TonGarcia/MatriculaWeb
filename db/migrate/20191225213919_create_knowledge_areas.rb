class CreateKnowledgeAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :knowledge_areas do |t|
      t.string :name, null: false
      t.text :description, null: true
      t.belongs_to :knowledge_area, foreign_key: true, false: true

      t.timestamps
    end
  end
end
