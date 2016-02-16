class CreateCinematographs < ActiveRecord::Migration
  def change
    create_table :cinematographs do |t|
      t.string :name, limit: 35
      t.string :surename, limit: 35

      t.timestamps null: false
    end
  end
end
