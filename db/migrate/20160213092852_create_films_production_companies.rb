class CreateFilmsProductionCompanies < ActiveRecord::Migration
  def change
    create_table :films_production_companies, id: false do |t|
      t.integer :film_id, null: false
      t.integer :production_company_id, null: false
    end
  end
end
