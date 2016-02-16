class ChangeLocaleNamesNameLimit < ActiveRecord::Migration
  def change
    change_column :locale_names, :name, :string, limit: 70
  end
end
