class Admin::LeadsController < Admin::ApplicationController
  before_action :set_lead, only: [:edit, :update, :destroy]

  def index
    @leads = Lead.all
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(safe_params)

    respond_to do |format|
      if @lead.save
        format.html { redirect_to edit_admin_lead_path(@lead), notice: "Lead was successfully created." }
      else
        format.html { render action: 'new' }
      end
    end

  end

  def edit
  end

  def update
    respond_to do |format|
      if @lead.update(safe_params)
        format.html { redirect_to edit_admin_lead_path(@lead), notice: 'Lead was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end

  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to admin_leads_url }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    def safe_params
      params.require(:lead).permit(:id, :contact_name, :contact_email, :contact_address, :contact_salary, :loan_scheme_id, :contact_borrow_amount, :contact_loan_period, :tenant_id)
    end
end
