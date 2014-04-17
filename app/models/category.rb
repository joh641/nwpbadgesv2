class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :badges

  def self.names
    names = []
    self.all.each { |category| names << category.name }
    names
  end
  
end
