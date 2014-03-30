class Claimcode < ActiveRecord::Base

  attr_accessible :code

  scope :sort_by_badge, -> { includes(:badge).order('badges.name ASC') }

  belongs_to :badge

  def claimed?
    claimed
  end

end
