class CreateDistributors < ActiveRecord::Migration
  def change
    create_table :distributors do |t|
      t.string :name, limit: 70

      t.timestamps null: false
    end
  end
end
