class Admin::LoanSchemesController < Admin::ApplicationController
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
    params.require(:contacts).permit(:id, :name)
  end
end
