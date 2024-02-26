class RemoveRoleTypeAndRoleIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role_type, :string
    remove_column :users, :role_id, :bigint
  end
end
