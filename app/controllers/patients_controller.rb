class PatientsController < ApplicationController
 
  def index
    @hospital = Hospital.find(params[:hospital_id])
    @patients = @hospital.patients

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patients }
    end
  end


  def show
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient }
    end
  end


  def new
    @hospital = Hospital.find(params[:hospital_id])
    @patient = @hospital.patients.new
    @user_session = UserSession.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient }
    end
  end


  def edit
    @patient = Patient.find(current_user.id)
    @hospital = @patient.hospital
    unless @hospital.forms.blank?
      @hospital.forms.first.form_fields.each do |field|
        fvalue = @patient.field_values.build
        fvalue.form_field = field
      end
    end
  end


  def create
    @hospital = Hospital.find(params[:hospital_id])
    @patient = @hospital.patients.new(params[:patient])
    
    if @patient.save
      flash[:notice] = 'You have successfully completed first step of your registration.'
      redirect_to(edit_hospital_patient_path(@hospital, @patient))
    else
      @user_session = UserSession.new #to avoid error
      render :action => "new"  
    end
  end


  def update
    @patient = Patient.find(params[:id])
    if @patient.update_attributes(params[:patient])
       flash[:notice] = 'Patient was successfully updated.'
        redirect_to(@patient)
      else
        render :action => "edit"
      end
  end


  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to(patients_url) }
      format.xml  { head :ok }
    end
  end
end
