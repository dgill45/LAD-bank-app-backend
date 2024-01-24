class Customer < ApplicationRecord
    has_one :user, as: :role, dependent: :destroy
    has_many :accounts
end
