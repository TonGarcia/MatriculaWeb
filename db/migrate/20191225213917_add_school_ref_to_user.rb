class AddSchoolRefToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :school_id, :integer, null: true, after: :locked_at
    add_index :users, :school_id
  end
end
