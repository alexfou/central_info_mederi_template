class InfoRequest < ActiveRecord::Base
  
  attr_accessible :creator_id, :title

  belongs_to :creator_id, class_name: "User"
  
end
