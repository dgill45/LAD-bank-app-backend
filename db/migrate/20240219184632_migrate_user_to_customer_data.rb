class MigrateUserToCustomerData < ActiveRecord::Migration[7.0]
  def up
    User.find_each do |user|
      Customer.create!(
        email: user.email,
        password_digest: user.password_digest,
        # add any other fields you need to migrate
      )
      # You can also handle any necessary cleanup here, if appropriate
    end
  end

  def down
    # If you want to make this migration reversible, add logic here to revert your changes.
    # Be cautious with data deletion to avoid unintended data loss.
    Customer.delete_all # This is a simple revert strategy but use with caution.
  end
end
