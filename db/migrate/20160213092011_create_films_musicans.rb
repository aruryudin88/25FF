class CreateFilmsMusicans < ActiveRecord::Migration
  def change
    create_table :films_musicans, id: false do |t|
      t.integer :film_id, null: false
      t.integer :musican_id, null: false
    end
  end
end
