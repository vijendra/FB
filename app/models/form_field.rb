class FormField < ActiveRecord::Base
  belongs_to :registration_form
  acts_as_list :scope => :registration_form
end
