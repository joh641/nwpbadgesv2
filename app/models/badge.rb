class Badge < ActiveRecord::Base
  
  attr_accessible :name, :image, :description, :claimcode, :category

  scope :category_search, lambda { |category| where("category = ?", category) }

  has_many :claimcodes, dependent: :destroy
  has_many :submissions, dependent: :destroy

  has_attached_file :image,
                    :storage => :s3,
                    :s3_credentials => S3_CREDENTIALS,
                    :path => "/badges/:style/:filename",
                    :styles => { :medium => "165x165>", :thumb => "100x100>" }, 
                    :default_url => "http://s3.amazonaws.com/nwp-badges/badges/medium/test-badge.png"

  validates :name, :presence => true
  validates :description, :presence => true

  def self.categories
    ['Level 1', 'Level 2', 'Educator Innovator']
  end

  def find_code(code)
    claimcodes.each do |claimcode|
      return claimcode if claimcode.code == code
    end
    nil
  end

end
