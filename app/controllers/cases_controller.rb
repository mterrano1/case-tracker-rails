class CasesController < ApplicationController

    # Creates a new case and assigns it to the manager with the fewest 
    # assigned cases by calling the "assign_to_manager" method.
    def create
        @created_case = @current_user.created_cases.create!(case_params)
        assign_to_manager
        render json: @created_case, status: :created
    end

    # Groups cases by allegation type and department and returns a JSON response with those groupings.
    def index
        cases_by_allegation_type = Case.group(:allegation_type).count
        cases_by_department = Case.group(:department).count

        render json: {
            cases_by_allegation_type: cases_by_allegation_type, 
            cases_by_department: cases_by_department
        }
    end

    # Finds the selected case by ID, updates it with the parameters passed in, and returns the updated case.
    def update
        selectedCase = Case.find(params[:id])
        selectedCase.update!(case_params)
        render json: selectedCase
    end

    # Finds the selected case by ID, destroys it, and returns a 204 no content response.
    def destroy
        selectedCase = Case.find(params[:id])
        selectedCase.destroy
        head :no_content
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
        params.permit(:id, :case, :allegation_type, :allegation, :department, :status, :resolution)
    end
end
