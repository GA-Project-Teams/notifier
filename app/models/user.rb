class User < ActiveRecord::Base
  has_many :messages
  before_save :set_password_token
  # after_save :send_welcome_email
  
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
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def set_password_token
    self.enable_strict_validation = true
    self.reset_password_token = User.reset_password_token
    self.reset_password_sent_at = Time.now
  end
  
  def send_welcome_email
    UserMailer.signup_confirmation(self).deliver
  end
  
end
