class CreateFilmsEditors < ActiveRecord::Migration
  def change
    create_table :films_editors, id: false do |t|
      t.integer :film_id, null: false
      t.integer :editor_id, null: false
    end
  end
end
