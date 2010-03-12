require 'test_helper'

class RegistrationFormsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => RegistrationForm.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    RegistrationForm.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    RegistrationForm.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to registration_form_url(assigns(:registration_form))
  end
  
  def test_edit
    get :edit, :id => RegistrationForm.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    RegistrationForm.any_instance.stubs(:valid?).returns(false)
    put :update, :id => RegistrationForm.first
    assert_template 'edit'
  end
  
  def test_update_valid
    RegistrationForm.any_instance.stubs(:valid?).returns(true)
    put :update, :id => RegistrationForm.first
    assert_redirected_to registration_form_url(assigns(:registration_form))
  end
  
  def test_destroy
    registration_form = RegistrationForm.first
    delete :destroy, :id => registration_form
    assert_redirected_to registration_forms_url
    assert !RegistrationForm.exists?(registration_form.id)
  end
end
