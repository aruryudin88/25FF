class CreateEditorsFilms < ActiveRecord::Migration
  def change
    create_table :editors_films, id: false do |t|
      t.integer :editor_id, null: false
      t.integer :film_id, null: false
    end
  end
end
