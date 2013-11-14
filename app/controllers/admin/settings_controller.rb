class Admin::SettingsController < Admin::ApplicationController

  def edit
  end

  def update
    respond_to do |format|
      if @tenant.update(safe_params)
        format.html { redirect_to edit_admin_tenant_path(@tenant), notice: 'Your information was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  private

  def safe_params
    params.require(:loan_scheme).permit(:id, :name, :description, :minimum_amount, :maximum_amount, :interest_rate, :is_income_before_tax, :income, :need_income_statement, :minimum_working_period, :minimum_working_period_id, :country_id, :state_id, :city_id, :minimum_age_requirement, :maximum_age_requirement, :need_mortgate, :need_guarantor, :fastest_approval_date, :tenant_id, :published, :active, :start_at, :stop_at)
  end
end
