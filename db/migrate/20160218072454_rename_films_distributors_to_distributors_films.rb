class RenameFilmsDistributorsToDistributorsFilms < ActiveRecord::Migration
  def change
    rename_table :films_distributors, :distributors_films
  end
end
