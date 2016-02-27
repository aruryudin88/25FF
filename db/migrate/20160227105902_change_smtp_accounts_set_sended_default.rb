class ChangeSmtpAccountsSetSendedDefault < ActiveRecord::Migration
  def change
    change_column :smtp_accounts, :sended, :integer, default: 0
  end
end
