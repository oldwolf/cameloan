# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tenant.all.destroy_all
Contact.all.destroy_all
LoanScheme.all.destroy_all

tenants = Tenant.create([{name: 'Cameloan', subdomain: 'cameloan'}, {name: 'Example', subdomain: 'example'}])

tenant = tenants.first

contact = Contact.create([{name: 'Oldwolf', income: 3000, tenant: tenant}, {name: 'Tang Xiao', income: 3500, tenant: tenant}])

loan_scheme = LoanScheme.create( name: 'APR 12% no guarantor no mortgage', description: 'Loan Scheme 1 description', minimum_amount: 0, maximum_amount: 100000, interest_rate: 12, is_income_before_tax: false, minimum_income: 2000, need_income_statement: true, minimum_working_period: 6, minimum_age_requirement: 20, maximum_age_requirement: 60, minimum_loan_period: 6, maximum_loan_period: 36, need_mortgage: false, need_guarantor: false, fastest_approval_day: 3, tenant: tenant)
