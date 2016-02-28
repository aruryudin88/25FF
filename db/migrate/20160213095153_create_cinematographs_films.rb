class CreateCinematographsFilms < ActiveRecord::Migration
  def change
    create_table :cinematographs_films, id: false do |t|
      t.integer :cinematograph_id, null: false
      t.integer :film_id, null: false
    end
  end
end
