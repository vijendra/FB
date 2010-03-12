class User < ActiveRecord::Base
  has_many :registration_forms
  attr_accessible :username, :email, :password,:password_confirmation

  acts_as_authentic do |c|
    c.login_field = :username
  end

end
