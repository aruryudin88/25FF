class CreateLocaleNames < ActiveRecord::Migration
  def change
    create_table :locale_names do |t|
      t.string :tag, limit: 7
      t.string :name, limit: 35

      t.timestamps null: false
    end
  end
end
