class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 32
      t.string :password
      t.timestamp :login_at
      t.string :head
      t.string :eyes
      t.string :nose
      t.string :mouth
      t.string :ears
      t.string :hair
      t.string :firstname, limit: 35
      t.string :lastname, limit: 35
      t.date :dob

      t.timestamps null: false
    end
  end
end
