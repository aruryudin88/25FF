class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.string :name, limit: 35
      t.string :surename, limit: 35

      t.timestamps null: false
    end
  end
end
