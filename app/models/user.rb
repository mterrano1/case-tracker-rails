class User < ApplicationRecord
    # Uses bcrypt to store a secure password in the database
    has_secure_password

    has_many :case_assignments, foreign_key: :assigned_employee_id
    has_many :assigned_cases, through: :case_assignments
    # A user has many created cases through customer_id which is a foreign key in the Case class
    has_many :created_cases, foreign_key: :customer_id, class_name: "Case"

    validates :first_name, :last_name, :role, :username, presence: true
    validates :username, uniqueness: { case_sensitive: false }
end
