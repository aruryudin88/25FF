class CreateFilmsStorytellers < ActiveRecord::Migration
  def change
    create_table :films_storytellers, id: false do |t|
      t.integer :film_id, null: false
      t.integer :storyteller_id, null: false
    end
  end
end
