class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :titile
      t.text :event_place
      t.integer :amount
      t.datetime :event_date

      t.timestamps
    end
  end
end
