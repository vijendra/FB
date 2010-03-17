class User < ActiveRecord::Base
  has_many :registration_forms
  has_and_belongs_to_many :roles
  attr_accessible :username, :email, :password,:password_confirmation

  acts_as_authentic do |c|
    c.login_field = :username
  end
  
  def user_type
     @_list ||= self.roles.collect(&:name)
  end
end
