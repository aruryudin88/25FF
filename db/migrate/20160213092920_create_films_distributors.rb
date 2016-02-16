class CreateFilmsDistributors < ActiveRecord::Migration
  def change
    create_table :films_distributors, id: false do |t|
      t.integer :film_id, null: false
      t.integer :distributor_id, null: false
    end
  end
end
