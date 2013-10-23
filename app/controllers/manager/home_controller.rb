class Manager::HomeController < Manager::ApplicationController
  def welcome
  end

  def safe_params
    params.require(:user).permit(:subdomain)
  end
end
