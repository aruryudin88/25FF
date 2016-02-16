class ChangeFilmsUsPremiereToUsaPremiere < ActiveRecord::Migration
  def change
    rename_column :films, :us_premiere, :USA_premiere
  end
end
