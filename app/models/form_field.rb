class FormField < ActiveRecord::Base
  belongs_to :form
  acts_as_list :scope => :form
end
