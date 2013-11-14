class Admin::ApplicationController < ApplicationController
  set_current_tenant_by_subdomain :tenant, :subdomain

  before_filter :check_tenant

  def current_tenant
    ActsAsTenant.current_tenant
  end

  def check_tenant
    if current_tenant.nil?
      redirect_to root_url
    end
  end
end
