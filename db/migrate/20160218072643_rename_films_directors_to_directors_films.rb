class RenameFilmsDirectorsToDirectorsFilms < ActiveRecord::Migration
  def change
    rename_table :films_directors, :directors_films
  end
end
