class HomeController < ApplicationController
  def welcome
  end

  def about
  end

  def contact
	@loan_scheme = LoanScheme.find(params[:id])
	cookies[:before_loan_scheme_id] =  @loan_scheme.id
  end

  def create
	@leads = Leads.new(contact_params)
	@leads.status = Leads::STATUS[0]
	respond_to do |format|
		if is_correct_loan_scheme_id(@leads) && @leads.save
		 format.json { render :json => @leads }
		else
		 format.json{ render :json => @leads.errors}
		end
	end
  end

  def showscheme
	@loanscheme = LoanScheme.find_by_sql(loanscheme_sql())
    render  'home/showscheme', :layout => nil
  end

  
  
  private
   def safe_params
	 params.require(:loanScheme).
	 permit(:minimum_age_requirement,:income,:maximum_amount,:maximum_loan_period)
   end

   def contact_params
	 params.require(:leads).
	 permit(:contact_name,:contact_phone,:contact_email,:contact_salary,:contact_address,:loan_scheme_id,
	 :contact_age,:contact_borrow_amount,:contact_loan_period)
   end

   def is_correct_loan_scheme_id(leads)
     _id = params[:leads][:loan_scheme_id]
	 if _id == cookies[:before_loan_scheme_id]
	   loan_scheme = LoanScheme.find(_id)
	   leads.tenant_id = loan_scheme.tenant_id 
	  return true
	 end
	 return false
   end

   
  
   
   def loanscheme_sql()
      loanparams = LoanScheme.new(safe_params)
	  #loanparams.save
	  sql_condition = []
	  sql_condition[0] = "select * from loan_schemes where minimum_age_requirement >=? and income >=? and maximum_amount >=? and maximum_loan_period >=? order by income desc"
	  sql_condition[1..3] = [loanparams.minimum_age_requirement,loanparams.income,loanparams.maximum_amount,loanparams.maximum_loan_period]
	  logger.info(sql_condition)
	  sql_condition
   end
end
