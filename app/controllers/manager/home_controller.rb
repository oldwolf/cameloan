class Manager::HomeController < Manager::ApplicationController
  def welcome
  end

  def dashboard
  end

  private

  def safe_params
    params.require(:user).permit(:subdomain)
  end
end
