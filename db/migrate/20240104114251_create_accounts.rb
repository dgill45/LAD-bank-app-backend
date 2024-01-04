class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :account_type
      t.decimal :balance

      t.timestamps
    end
  end
end
