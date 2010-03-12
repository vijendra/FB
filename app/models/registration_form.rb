class RegistrationForm < ActiveRecord::Base
  attr_accessible :name, :description, :form_fields_attributes

  has_many :form_fields, :dependent => :destroy, :order => :position
  accepts_nested_attributes_for :form_fields, :allow_destroy => true
end
