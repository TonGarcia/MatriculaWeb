class AddSchoolRefToUser < ActiveRecord::Migration[5.1]
  def change
    #add_reference :users, :school, foreign_key: true, null: true
  end
end
