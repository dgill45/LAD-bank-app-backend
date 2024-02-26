# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Clear existing data
Transaction.destroy_all
Account.destroy_all
Admin.destroy_all
Customer.destroy_all
User.destroy_all

# Create sample admins
admin1 = Admin.create!(first_name: "Jane", last_name: "Doe")
admin2 = Admin.create!(first_name: "John", last_name: "Smith")

# Create sample customers
customer1 = Customer.create!(first_name: "Alice", last_name: "Johnson", username: "alicejohnson", email: "alice@example.com", password_digest: "password1")
customer2 = Customer.create!(first_name: "Bob", last_name: "Brown", username: "bobbrown", email: "bob@example.com", password_digest: "password2")


# Create accounts for customers
account1 = Account.create!(customer_id: customer1.id, account_type: "Savings", balance: 1000.00)
account2 = Account.create!(customer_id: customer2.id, account_type: "Checking", balance: 500.00)

# Create transactions for accounts
transaction1 = Transaction.create!(account_id: account1.id, amount: 200.00, transaction_type: "Deposit", created_at: "2024-02-16 10:00:00", updated_at: "2024-02-16 10:00:00")
transaction2 = Transaction.create!(account_id: account2.id, amount: 100.00, transaction_type: "Withdrawal", created_at: "2024-02-17 15:00:00", updated_at: "2024-02-17 15:00:00")

puts "Seeds data created successfully!"
