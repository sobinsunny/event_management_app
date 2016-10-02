class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :location
      t.integer :entry_fee
      t.datetime :event_date

      t.timestamps
    end
  end
end
