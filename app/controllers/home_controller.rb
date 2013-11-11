class HomeController < ApplicationController
  def welcome
  end

  def about
  end

  def contact
  end

  def showscheme
	@loanscheme = LoanScheme.find_by_sql(loanscheme_sql())
    render  'home/showscheme', :layout => nil
  end

  
  private
   def safe_params
	 params.require(:loanScheme).
	 permit(:minimum_age_requirement,:income,:maximum_amount,:maximum_period)
   end
  
   
   def loanscheme_sql()
      loanparams = LoanScheme.new(safe_params)
	  #loanparams.save
	  sql_condition = []
	  sql_condition[0] = "select * from loan_schemes where minimum_age_requirement >=? and income >=? and maximum_amount >=? and maximum_period >=? order by income desc"
	  sql_condition[1..3] = [loanparams.minimum_age_requirement,loanparams.income,loanparams.maximum_amount,loanparams.maximum_period]
	  logger.info(sql_condition)
	  sql_condition
   end
end
