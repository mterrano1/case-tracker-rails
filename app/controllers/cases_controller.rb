class CasesController < ApplicationController

    #POST /cases
    def create
        created_case = @current_user.created_cases.create!(case_params)
        render json: created_case, status: :created
    end

    private

    def case_params
        params.permit(:allegation_type, :allegation, :department, :status)
    end
end
