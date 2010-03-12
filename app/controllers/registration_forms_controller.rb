class RegistrationFormsController < ApplicationController
  def index
    @registration_forms = RegistrationForm.all
  end
  
  def show
    @registration_form = RegistrationForm.find(params[:id])
  end
  
  def new
    @registration_form = RegistrationForm.new
    @registration_form.form_fields.build
  end
  
  def create
    @registration_form = RegistrationForm.new(params[:registration_form])
    if @registration_form.save
      flash[:notice] = "Successfully created registration form."
      redirect_to @registration_form
    else
      render :action => 'new'
    end
  end
  
  def edit
    @registration_form = RegistrationForm.find(params[:id])
  end
  
  def update
    @registration_form = RegistrationForm.find(params[:id])
    if @registration_form.update_attributes(params[:registration_form])
      flash[:notice] = "Successfully updated registration form."
      redirect_to @registration_form
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @registration_form = RegistrationForm.find(params[:id])
    @registration_form.destroy
    flash[:notice] = "Successfully destroyed registration form."
    redirect_to registration_forms_url
  end
end
