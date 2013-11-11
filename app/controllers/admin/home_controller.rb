class Admin::HomeController < Admin::ApplicationController
  def welcome
    redirect_to admin_home_dashboard_url
  end

  def dashboard
  end

  private

  def safe_params
    params.require(:user).permit(:subdomain)
  end
end
