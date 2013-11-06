class Manager::LoansController < Manager::ApplicationController
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
    params.require(:loans).permit(:id)
  end
end
