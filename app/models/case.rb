class Case < ApplicationRecord
    has_many :case_assignments, foreign_key: :assigned_case_id
    has_many :case_employees, through: :case_assignments, source: :assigned_employee
    belongs_to :customer, class_name: "User"
end
