class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.text :title
      t.text :description
      t.integer :cost
      t.date :date

      t.timestamps
    end
  end
end
