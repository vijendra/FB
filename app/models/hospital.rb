class Hospital < ActiveRecord::Base
  has_many :forms
  has_many :patients
end
