class Admin < ApplicationRecord
    has_one :user, as: :role, dependent: :destroy
end