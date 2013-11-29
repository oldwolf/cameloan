class Admin::SettingsController < Admin::ApplicationController
  before_action :set_tenant, only: [:edit, :update]

  def edit
    @primary_phone = @tenant.phones.where(category: "Primary").first_or_initialize
    @primary_address = @tenant.addresses.where(category: "Primary").first_or_initialize
    @billing_address = @tenant.addresses.where(category: "Billing").first_or_initialize
  end

  def update
    respond_to do |format|
      if @tenant.update(safe_params)
        format.html { redirect_to edit_admin_setting_path(@tenant), notice: "Your information was successfully updated." }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  private

  def set_tenant
    @tenant = ActsAsTenant.current_tenant
  end

  def safe_params
    params.require(:tenant).permit(:id, :name, :subdomain, phones_attributes: [:id, :number, :category], addresses_attributes: [:id, :full_address, :category])
  end
end
