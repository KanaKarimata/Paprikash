class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }
      
      t.timestamps
      t.index [:owner_id], unique: true
    end
  end
end
