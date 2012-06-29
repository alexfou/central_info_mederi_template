class InfoRequest < ActiveRecord::Base
  
  attr_accessible :creator, :title

  belongs_to :creator, :class_name => "User"
  
end
