# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Clear existing data
Transaction.destroy_all
Account.destroy_all
Customer.destroy_all
Admin.destroy_all
User.destroy_all

# Create Admins and their Users
3.times do |i|
  admin = Admin.create!(
    # Add attributes specific to your Admin model
    first_name: "AdminFirst#{i}",
    last_name: "AdminLast#{i}"
  )

  User.create!(
    email: "admin#{i}@example.com",
    password: "adminpassword#{i}",
    role: admin
  )
end

# Create Customers and their Users
5.times do |i|
  customer = Customer.create!(
    first_name: "CustomerFirst#{i}",
    last_name: "CustomerLast#{i}"
    # You might have other attributes specific to the Customer model
  )

  user = User.create!(
    email: "customer#{i}@example.com",
    password: "customerpassword#{i}",
    role: customer
  )

  # Create Accounts for each Customer
  2.times do |j|
    account = Account.create!(
      customer: customer,
      account_type: ["Checking", "Savings"].sample,
      balance: rand(1000..5000)
    )

    # Create Transactions for each Account
    5.times do
      transaction_date = Date.today - rand(1..30).days
      account.transactions.create!(
        amount: rand(10..500),
        transaction_type: ["Deposit", "Withdrawal"].sample,
        created_at: transaction_date
      )
    end
  end
end
