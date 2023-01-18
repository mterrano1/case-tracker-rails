class CasesController < ApplicationController

    #POST /cases
    def create
        @created_case = @current_user.created_cases.create!(case_params)
        # Automatically assign all new cases to the manager with the fewest assigned cases
        assign_to_manager
        render json: @created_case, status: :created
    end

    #GET /cases
    def index
    end

    private

    # Query all users with the "Manager" role and assign each new case to the Manager
    # with the fewest cases assigned to them.
    def assign_to_manager
        managers = User.where(role: "Manager")
        manager = managers.sort_by{ |u| u.case_assignments.count }.first
        CaseAssignment.create!(assigned_case_id: @created_case.id, assigned_employee_id: manager.id)
    end

    def case_params
        params.permit(:allegation_type, :allegation, :department, :status)
    end
end
