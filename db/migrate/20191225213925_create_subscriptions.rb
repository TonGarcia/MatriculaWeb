class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.string :access_type
      t.integer :amount_time_watching
      t.belongs_to :user, foreign_key: true
      t.belongs_to :subject, foreign_key: true

      t.timestamps
    end
  end
end
