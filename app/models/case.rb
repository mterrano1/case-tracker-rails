class Case < ApplicationRecord
    # A Case has many case_assignments through assigned_case_id, which dependently destroy when a case is destroyed
    has_many :case_assignments, foreign_key: :assigned_case_id, dependent: :destroy
    # A Case has many case employees through case_assignments' assigned_employee relationship
    has_many :case_employees, through: :case_assignments, source: :assigned_employee
    # A Case belongs to a customer who is a User
    belongs_to :customer, class_name: "User"

    validates :allegation_type, :allegation, :department, :status, :customer_id, presence: true
end
