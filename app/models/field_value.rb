class FieldValue < ActiveRecord::Base
  belongs_to :form_preview
  belongs_to :form_field
  belongs_to :patient
end
