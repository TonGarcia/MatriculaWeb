class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :description
      t.integer :workload
      t.string :online_link
      t.string :class_schedule
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
