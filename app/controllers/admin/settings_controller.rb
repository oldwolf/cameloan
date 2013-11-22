class Admin::SettingsController < Admin::ApplicationController
  before_action :set_tenant, only: [:edit, :update]

  def edit
    @primary_phone = @tenant.phones.where(category: "Primary").first_or_initialize
    @primary_address = @tenant.addresses.where(category: "Primary").first_or_initialize
    #primary_phone = @tenant.phones.where({category: "Primary"}).first
    #@primary_phone = primary_phone.nil? ? @tenant.phones.build(category: "Primary") : primary_phone
    #primary_address = @tenant.addresses.where({category: "Primary"}).first
    #@primary_address = primary_address.nil? ? @tenant.addresses.build(category: "Primary") : primary_address
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
