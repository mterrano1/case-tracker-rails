class CaseAssignmentsController < ApplicationController

    # POST /cases/:case_id/case_assignment
    def create
        case_assignment = CaseAssignment.create!(case_assignment_params)
        render json: case_assignment, status: :created
    end

    #GET /case_assignments
    def index
        case_assignments = @current_user.assigned_cases
        render json: case_assignments
    end

    private

    def case_assignment_params
        params.permit(:assigned_case_id, :assigned_employee_id)
    end
end
