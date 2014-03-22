class Submission < ActiveRecord::Base
  
  attr_accessible :description
  belongs_to :badge

end
