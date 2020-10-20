class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :location
      t.integeruser_id :Date

      t.timestamps null: false
    end
  end
end
