class FormsController < ApplicationController
  def index
    @hospital = Hospital.find(params[:hospital_id])
    @forms = Form.all
  end
  
  def show
    @hospital = Hospital.find(params[:hospital_id])
    @form = Form.find(params[:id])
    @preview = FormPreview.new

    #Setting field values
    @form.form_fields.all.each do |field| 
	  new_field = @preview.field_values.build
      new_field.form_field = field 
    end
  end
  
  def new
    @hospital = Hospital.find(params[:hospital_id])
    @form = @hospital.forms.new
    @form.form_fields.build
  end
  
  def create
    @hospital = Hospital.find(params[:hospital_id])
    @form = @hospital.forms.new(params[:form])
    if @form.save
      flash[:notice] = "Successfully created form."
      redirect_to @form
    else
      render :action => 'new'
    end
  end
  
  def edit
    @hospital = Hospital.find(params[:hospital_id])
    @form = Form.find(params[:id])
  end
  
  def update
    @form = Form.find(params[:id])
    if @form.update_attributes(params[:form])
      flash[:notice] = "Successfully updated form."
      redirect_to @form
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    flash[:notice] = "Successfully destroyed form."
    redirect_to forms_url
  end
end
