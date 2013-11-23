# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(() -> 
	#home page
	searchLoan =
	  params : () -> 
	    searchLoan.loan_property["loanScheme[minimum_age_requirement]"] =  $("#minage").val() 
	    searchLoan.loan_property["loanScheme[income]"] = $("#monthlyIncome").val()
	    searchLoan.loan_property["loanScheme[maximum_amount]"] =  $("#borrow").val()
	    searchLoan.loan_property["loanScheme[maximum_loan_period]"] =  $("#borrowingDeadline").val()
	    searchLoan.loan_property
	  loan_property : 
	    {"loanScheme[minimum_age_requirement]" :0,
	    "loanScheme[income]" :0,
	    "loanScheme[maximum_amount]" :0,
	    "loanScheme[maximum_loan_period]" :0
	    }
	 
	  verify_params:() ->
	    loan =   searchLoan.params()
	   
	    if !searchLoan.fields_reg.age.test(loan["loanScheme[minimum_age_requirement]"]) 
               return false
	    if  !searchLoan.fields_reg.salary.test(loan["loanScheme[income]"]) 
	       return false
	    if  !searchLoan.fields_reg.maximum_amount.test(loan["loanScheme[maximum_amount]"]) 
	       return false
	    if  !searchLoan.fields_reg.maximum_period.test(loan["loanScheme[maximum_loan_period]"]) 
	       return false
	    true
	  fields_reg:
	    {
	     age: /^[2-5]{1}[0-9]{1}$/,
	     salary:/(^[2-9]{1}[0-9]{3,}$)|(^[1]{1}[0-9]{4,}$)/,
	     maximum_amount:/^\d{3,}$/,
	     maximum_period:/^\d{1,2}$/
	    }
	  submit:() ->
	    bind_event.calculate_unbind_click()
	    if searchLoan.verify_params()
	      searchLoan.load_data()
	    else
	      bind_event.calculate_bind_click()
	    false
	  load_data:() ->
	    
	    $("#searchResultsContent").load('home/showscheme',searchLoan.loan_property,
	    () -> 
	       bind_event.calculate_bind_click()
	       bind_event.apply_bind_click()
	       false)
	    false

	#contact page
	contact_apply = () ->
	  check_params = ()->
	    false
	   apply_params={
	    "leads[contact_name]" : $("#contact_name").val(),
	    "leads[contact_age]"  : $("#contact_age").val(),
	    "leads[contact_email]" : $("#contact_email").val(),
	    "leads[contact_phone]" : $("#contact_phone").val(),
	    "leads[contact_salary]":$("#contact_income").val(),
	    "leads[contact_borrow_amount]":$("#contact_borrow_amount").val(),
	    "leads[contact_loan_period]":$("#contact_loan_period").val(),
	    "leads[contact_address]":$("#contact_address").val(),
	    "leads[loan_scheme_id]" :$("#which_loan_scheme").val()
	  }
	  this.submit = ()->
	    bind_event.contact_apply_unbind_click()
	    #if check_params()
	    #  false
	    $.post("/home/create",apply_params,(msg)->
	     if show_errors msg
	       $("#fill-contact-info").empty().append($("#application-success").html())
	     false
	    )
	    false
	  show_errors= (msg)->
	    $("#fill-contact-info label span").each((i)->
	      $(this).empty().append("*")
	      false
	    )
	    if !msg.id?
	      for c of msg 
	        $("##{c}").prev().children().last().empty().append("#{msg[c]}")
	      bind_event.contact_apply_bind_click()
	      false
	    else
	     true
	  false	

	bind_event = 
	  calculate_bind_click :() -> 
	    $("#calculate").bind("click",() -> 
	      searchLoan.submit()
	      true)
	    false
	  calculate_unbind_click :() -> 
	    $("#calculate").unbind("click")
	    false
	  apply_bind_click :() ->
	   $("div>ul>li>button[which_loan]").bind("click",() ->
	     window.location.href="home/contact?id="+$(this).attr("which_loan")
	     true)
	   false
	  contact_apply_bind_click :() ->
	     $("#contact_apply").bind("click",() ->
	       c_apply =  new contact_apply()
	       c_apply.submit()
	       true)
	     false
	  contact_apply_unbind_click :() -> 
	    $("#contact_apply").unbind("click")
	    false
	  contact_input_bind_focusout :() ->
	    $("input[tips]").each((i)->
	      console.debug(i)
	      That = this
	      $(this).bind("focusout",()->
	       _reg = new RegExp($(That).attr("reg"))
	       _b =  _reg.test(That.value)
	       _tips = $(That).attr("tips")
	       if !_b
	         $(That).prev().children().last().empty().append(_tips)
	       else
	        $(That).prev().children().last().empty().append("*")
	       false
	      )
	      true
	    )
	    false
	  init:()->
	    bind_event.calculate_bind_click()
	    bind_event.contact_apply_bind_click()
	    bind_event.contact_input_bind_focusout()
	    false
	 
	bind_event.init()
	true  
)







