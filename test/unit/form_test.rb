require 'test_helper'

class FormTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert RegistrationForm.new.valid?
  end
end
