class Admin::LoanSchemesController < Admin::ApplicationController
  before_action :set_loan_scheme, only: [:edit, :update, :destroy]

  def index
    @loan_schemes = LoanScheme.all
  end

  def new
    @loan_scheme = LoanScheme.new
  end

  def create
    @loan_scheme = LoanScheme.new(safe_params)

    respond_to do |format|
      if @loan_scheme.save
        format.html { redirect_to edit_admin_loan_scheme_path(@loan_scheme), notice: "Loan Scheme was successfully created." }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @loan_scheme.update(safe_params)
        format.html { redirect_to edit_admin_loan_scheme_path(@loan_scheme), notice: 'Loan scheme was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /loan_schemes/1
  # DELETE /loan_schemes/1.json
  def destroy
    @loan_scheme.destroy
    respond_to do |format|
      format.html { redirect_to admin_loan_schemes_url }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_loan_scheme
    @loan_scheme = LoanScheme.find(params[:id])
  end

  def safe_params
    params.require(:loan_scheme).permit(:id, :name, :description, :minimum_amount, :maximum_amount, :interest_rate, :is_income_before_tax, :income, :need_income_statement, :minimum_working_period, :minimum_working_period_id, :country_id, :state_id, :city_id, :minimum_age_requirement, :maximum_age_requirement, :need_mortgate, :need_guarantor, :fastest_approval_date, :tenant_id, :published, :active, :start_at, :stop_at)
  end
end
