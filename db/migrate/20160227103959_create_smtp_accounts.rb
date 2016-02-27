class CreateSmtpAccounts < ActiveRecord::Migration
  def change
    create_table :smtp_accounts do |t|
      t.string :address
      t.integer :port
      t.string :domain
      t.string :user_name
      t.string :password
      t.string :authentication, limit: 32
      t.boolean :enable_starttls_auto
      t.integer :sended

      t.timestamps null: false
    end
  end
end
