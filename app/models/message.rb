class Message < ActiveRecord::Base
  attr_accessible :content, :to_user_id, :from_user_id, :message_type_id
  
  validates :content, :presence => true
  validates :to_user_id, :presence => true
  validates :from_user_id, :presence => true
  validates :message_type_id, :presence => true
  
end
