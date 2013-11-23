class HomeController < ApplicationController
  def welcome
  end

  def about
  end

  def lead_form
    @loan_scheme = LoanScheme.find(params[:id])
    session[:loan_scheme_id] =  @loan_scheme.id
  end

  def create_lead
    @lead = Lead.new(lead_params)
    @lead.status = "PENDING"
    respond_to do |format|
      if @lead.save
        format.json { render :json => @lead }
      else
        format.json{ render :json => @lead.errors}
      end
    end
  end

  def show_schemes
    @loan_schemes = LoanScheme.all.where("minimum_age_requirement <= :age AND income <= :income AND maximum_amount >= :amount AND maximum_loan_period >= :loan_period",
      {
        age: loan_scheme_params[:age],
        income: loan_scheme_params[:income],
        amount: loan_scheme_params[:amount],
        loan_period: loan_scheme_params[:loan_period]
      }
    )

    render  'home/show_schemes', :layout => nil
  end

  private
  def loan_scheme_params
    params.require(:loan_scheme).permit(:age, :income, :amount, :loan_period)
  end

  def lead_params
    params.require(:lead).permit(:contact_name, :contact_phone, :contact_email, :contact_salary, :contact_address, :loan_scheme_id, :contact_age, :contact_borrow_amount, :contact_loan_period)
  end

  def is_correct_loan_scheme_id(leads)
    loan_scheme_id = params[:leads][:loan_scheme_id]

    if loan_scheme_id == session[:loan_scheme_id]
      loan_scheme = LoanScheme.find(loan_scheme_idid)
      leads.tenant_id = loan_scheme.tenant_id
      return true
    end
    return false
  end
end

