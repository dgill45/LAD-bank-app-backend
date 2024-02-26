class User < ApplicationRecord
    class NotAuthorized < StandardError; end
    has_secure_password
end
