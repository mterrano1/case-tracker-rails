class CaseAssignment < ApplicationRecord
    belongs_to :assigned_employee, class_name: "User"
    belongs_to :assigned_case, class_name: "Case"
end
