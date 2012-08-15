class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessor :enable_strict_validation

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :company_name, :password, :password_confirmation, :remember_me, :phone_number, :preference

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :company_name, :presence => true
  validates :password, :presence => true, :if => :enable_strict_validation
  validates :password_confirmation, :presence => true, :if => :enable_strict_validation

  validates :email, :uniqueness => true
  
end
