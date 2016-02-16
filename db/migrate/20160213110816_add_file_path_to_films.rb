class AddFilePathToFilms < ActiveRecord::Migration
  def change
    add_column :films, :file_path, :string, limit: 70
  end
end
