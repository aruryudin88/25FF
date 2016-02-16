class ChangeFilmsCountryAndLanguageLimits < ActiveRecord::Migration
  def change
    change_column :films, :language, :string, limit: 35
    change_column :films, :country, :string, limit: 35
  end
end
