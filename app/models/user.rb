class User < ApplicationRecord
    has_secure_password

    validates :first_name, :last_name, :role, :username, presence: true
    validates :username, uniqueness: { case_sensitive: false }
end
