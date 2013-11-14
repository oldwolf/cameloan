class Admin::SettingsController < Admin::ApplicationController
  before_action :set_tenant, only: [:edit, :update]

  def edit
  end

  def update
    respond_to do |format|
      if @tenant.update(safe_params)
        format.html { redirect_to edit_admin_setting_path(@tenant), notice: 'Your information was successfully updated.' }
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
    params.require(:tenant).permit(:id, :name, :subdomain)
  end
end
