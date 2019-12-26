class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :code
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
