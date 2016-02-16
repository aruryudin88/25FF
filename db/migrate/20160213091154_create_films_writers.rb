class CreateFilmsWriters < ActiveRecord::Migration
  def change
    create_table :films_writers, id: false do |t|
      t.integer :film_id, null: false
      t.integer :writer_id, null: false
    end
  end
end
