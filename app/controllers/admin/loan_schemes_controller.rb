class Admin::LoanSchemesController < Admin::ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  private

  def safe_params
    params.require(:loan_scheme).permit(:id, :name, :description, :maximum_amount, :interest_rate, :is_income_before_tax, :income, :need_income_statement, :minimum_working_period, :minimum_working_period_id, :country_id, :state_id, :city_id, :minimum_age_requirement, :maximum_age_requirement, :interest_amount, :interest_type, :need_mortgate, :need_guarantor, :fastest_approval_date, :tenant_id)
  end
end
