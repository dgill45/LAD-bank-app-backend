class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :account, null: false, foreign_key: true
      t.decimal :amount
      t.string :transaction_type
      t.datetime :date
      t.decimal :balance

      t.timestamps
    end
  end
end
