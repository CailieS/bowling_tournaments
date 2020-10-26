class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :location
      t.string :date
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
