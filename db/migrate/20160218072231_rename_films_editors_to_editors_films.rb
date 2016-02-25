class RenameFilmsEditorsToEditorsFilms < ActiveRecord::Migration
  def change
    rename_table :films_editors, :editors_films
  end
end
