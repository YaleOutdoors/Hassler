class AddUserTripRelation < ActiveRecord::Migration
  def change
    create_table :leaders do |t|
      t.integer :user_id, index: true
      t.string :description
    end
    create_table :trips_users, id: false do |t|
      t.belongs_to :trip, index: true
      t.belongs_to :user, index: true
    end
    add_column :trips, :leader_id, :integer, index: true
    remove_column :users, :description
  end

end
