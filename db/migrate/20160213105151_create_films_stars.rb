class CreateFilmsStars < ActiveRecord::Migration
  def change
    create_table :films_stars, id: false do |t|
      t.integer :film_id, null: false
      t.integer :star_id, null: false
    end
  end
end
