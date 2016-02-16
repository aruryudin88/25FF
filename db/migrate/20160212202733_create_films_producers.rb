class CreateFilmsProducers < ActiveRecord::Migration
  def change
    create_table :films_producers, id: false do |t|
      t.integer :film_id, null: false
      t.integer :producer_id, null: false
    end
  end
end
