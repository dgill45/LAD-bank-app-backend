class AddAuthenticationToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :email, :string
    add_index :customers, :email, unique: true
    add_column :customers, :password_digest, :string
    add_column :customers, :username, :string
  end
end
