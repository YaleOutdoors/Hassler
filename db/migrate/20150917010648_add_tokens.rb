class AddTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.text :text, unique: true, index: true
      t.integer :user_id
      t.timestamps
    end
  end
end
