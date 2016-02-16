class ChangeFilmsUsaPremiereToUsaPremiere < ActiveRecord::Migration
  def change
    rename_column :films, :USA_premiere, :usa_premiere
  end
end
