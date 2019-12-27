class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.belongs_to :user, null: false, default: 1

      t.timestamps
    end
  end
end
