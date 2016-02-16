class CreateFilmsDirectors < ActiveRecord::Migration
  def change
    create_table :films_directors, id: false do |t|
      t.integer :film_id, null: false
      t.integer :director_id, null: false
    end
  end
end
