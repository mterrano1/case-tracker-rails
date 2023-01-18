class User < ApplicationRecord
    has_secure_password

    has_many :case_assignments, foreign_key: :assigned_employee_id
    has_many :assigned_cases, through: :case_assignments
    has_many :created_cases, foreign_key: :customer_id, class_name: "Case"

    validates :first_name, :last_name, :role, :username, presence: true
    validates :username, uniqueness: { case_sensitive: false }
end
