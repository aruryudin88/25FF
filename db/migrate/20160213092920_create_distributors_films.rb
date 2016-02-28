class CreateDistributorsFilms < ActiveRecord::Migration
  def change
    create_table :distributors_films, id: false do |t|
      t.integer :distributor_id, null: false
      t.integer :film_id, null: false
    end
  end
end
