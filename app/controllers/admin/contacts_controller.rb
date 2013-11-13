class Admin::ContactsController < Admin::ApplicationController
  before_action :set_contact, only: [:edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(safe_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to edit_admin_contact_path(@contact), notice: "Contact was successfully created." }
      else
        format.html { render action: 'new' }
      end
    end

  end

  def edit
  end

  def update
    respond_to do |format|
      if @contact.update(safe_params)
        format.html { redirect_to edit_admin_contact_path(@contact), notice: 'Contact was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end

  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to admin_contacts_url }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def safe_params
      params.require(:contact).permit(:id, :name, :tenant_id, :income)
    end
end
