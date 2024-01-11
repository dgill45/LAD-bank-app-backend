# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Clear existing data
#Transaction.destroy_all
#Account.destroy_all
Customer.destroy_all

# Create Customers
5.times do |i|
  Customer.create!(
    first_name: "First#{i}",
    last_name: "Last#{i}",
    email: "email#{i}@example.com",
    password: "password#{i}"
  )
end

# Create Accounts for each Customer
Customer.find_each do |customer|
  2.times do |i|
    account = customer.accounts.create!(
      account_type: ["Checking", "Savings"].sample,
      balance: rand(1000..5000)
    )

    # Create Transactions for each Account
    5.times do
      account.transactions.create!(
        amount: rand(10..500),
        transaction_type: ["Deposit", "Withdrawal"].sample,
        balance: account.balance, # This should be calculated based on the transaction type and amount
        date: Date.today - rand(1..30).days
      )
    end
  end
end
