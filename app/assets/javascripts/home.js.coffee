# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(() -> 
	searchLoan =
	  params : () -> 
	    searchLoan.loanproperty["loanScheme[minimum_age_requirement]"] =  $("#minage").val() 
	    searchLoan.loanproperty["loanScheme[income]"] = $("#monthlyIncome").val()
	    searchLoan.loanproperty["loanScheme[maximum_amount]"] =  $("#borrow").val()
	    searchLoan.loanproperty["loanScheme[maximum_period]"] =  $("#borrowingDeadline").val()
	    searchLoan.loanproperty
	  loanproperty : 
	    {"loanScheme[minimum_age_requirement]" :0,
	    "loanScheme[income]" :0,
	    "loanScheme[maximum_amount]" :0,
	    "loanScheme[maximum_period]" :0
	    }
	 
	  verifyParams:() ->
	    loan =   searchLoan.params()
	   
	    if !searchLoan.ageReg.test(loan["loanScheme[minimum_age_requirement]"]) 
               return false
	    if  !searchLoan.salaryReg.test(loan["loanScheme[income]"]) 
	       return false
	    if  !searchLoan.maximumAmountReg.test(loan["loanScheme[maximum_amount]"]) 
	       return false
	    if  !searchLoan.maximumPeriodReg.test(loan["loanScheme[maximum_period]"]) 
	       return false
	    true
	  ageReg: /^[2-5]{1}[0-9]{1}$/
	  salaryReg:/(^[2-9]{1}[0-9]{3,}$)|(^[1]{1}[0-9]{4,}$)/
	  maximumAmountReg:/^\d{3,}$/
	  maximumPeriodReg:/^\d{1,2}$/
	  submit:() ->
	    bindevent.calculateUnbindClick()
	    if searchLoan.verifyParams()
	      searchLoan.loadData()
	    else
	      bindevent.calculateBindClick()
	    false
	  loadData:() ->
	    
	    $("#searchResultsContent").load('home/showscheme',searchLoan.loanproperty,
	    () -> 
	       bindevent.calculateBindClick() 
	       false)
	    false
	    
	bindevent = 
	  calculateBindClick :() -> 
	    $("#calculate").bind("click",() -> 
	      searchLoan.submit()
	      true)
	    false
	  calculateUnbindClick :() -> 
	    $("#calculate").unbind("click")
	    false
	bindevent.calculateBindClick()
	true  
)







