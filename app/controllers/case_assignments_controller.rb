class CaseAssignmentsController < ApplicationController

    # Creates a new case assignment and updates the assigned case's status to "Open."
    def create
        case_assignment = CaseAssignment.create!(case_assignment_params)
        case_assignment.assigned_case.update!(status: "Open")
        render json: case_assignment, status: :created
    end

    # Retrieves all case assignments for the current user.
    def index
        case_assignments = @current_user.assigned_cases
        render json: case_assignments
    end

    private

    # Returns the permitted parameters for creating a new case assignment.
    def case_assignment_params
        params.permit(:assigned_case_id, :assigned_employee_id)
    end
end
