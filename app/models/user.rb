class User < ActiveRecord::Base
  rolify
  has_many    :messages
  before_save :set_password_token
  after_save  :normalize_phone_number

  # after_save :send_welcome_email
  scope :by_company, order("company_name ASC")
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessor :enable_strict_validation

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :company_name, :password, :password_confirmation, :remember_me, :phone_number, :preference, :role_ids

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :company_name, :presence => true
  validates :password, :presence => true, :if => :enable_strict_validation
  validates :password_confirmation, :presence => true, :if => :enable_strict_validation

  validates :email, :uniqueness => true

  ROLES = %w[admin user]

  def role_symbols
    [role.to_sym]
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def set_password_token
    self.enable_strict_validation = true
    self.reset_password_token = User.reset_password_token
    self.reset_password_sent_at = Time.zone.now
  end

  def normalize_phone_number
    self.phone_number.rstrip!
    self.phone_number.gsub!(/[-. ]/,'')
  end
  
  def send_welcome_email
    UserMailer.signup_confirmation(self).deliver
  end
  
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  last_name              :string(255)
#  company_name           :string(255)
#  phone_number           :string(255)
#  preference             :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

