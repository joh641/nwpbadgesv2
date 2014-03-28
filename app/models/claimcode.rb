class Claimcode < ActiveRecord::Base

  attr_accessible :code

  belongs_to :badge

  def claimed?
    claimed
  end

end
