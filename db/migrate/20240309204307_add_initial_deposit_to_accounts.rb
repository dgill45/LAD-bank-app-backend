class AddInitialDepositToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :initial_deposit, :decimal
  end
end
