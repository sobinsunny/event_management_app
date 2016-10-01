class CreateUserEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :user_events do |t|
      t.references :events, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
