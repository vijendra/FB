class Patient < User
  has_many :field_values
  belongs_to :hospital
  
  accepts_nested_attributes_for :field_values, :allow_destroy => true
end
