class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
	@user = User.new #User registration also provided in same screen
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
	  patient = Patient.find(current_user.id)
	  hospital = patient.hospital
      redirect_to edit_hospital_patient_url(hospital, patient)
    else
     render :action => 'new'
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to new_user_session_url
  end

end
