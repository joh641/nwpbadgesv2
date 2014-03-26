class Submission < ActiveRecord::Base
  
  attr_accessible :name, :email, :description
  
  belongs_to :badge

  PENDING = 0
  APPROVED = 1
  REJECTED = 2

  def approved?
    status == APPROVED
  end

  def rejected?
    status == REJECTED
  end

  def pending?
    status == PENDING
  end

  def get_status
    if status == 0
      "Pending"
    elsif status == 1
      "Approved"
    else
      "Rejected"
    end
  end

end
