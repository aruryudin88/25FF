class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :name, limit: 70
      t.text :description
      t.date :premiere
      t.date :us_premiere
      t.string :genre, limit: 35
      t.integer :running_time
      t.string :country, limit: 70
      t.string :language, limit: 70
      t.money :budget
      t.money :box_office

      t.timestamps null: false
    end
  end
end
