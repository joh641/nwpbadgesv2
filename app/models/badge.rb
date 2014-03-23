class Badge < ActiveRecord::Base
  
  attr_accessible :name, :image, :description, :claimcode

  has_many :submissions, dependent: :destroy
  has_many :users, through: :submissions
  has_attached_file :image,
                    :storage => :s3,
                    :s3_credentials => S3_CREDENTIALS,
                    :path => "/badges/:style/:filename",
                    :styles => { :medium => "165x165>", :thumb => "100x100>" }, 
                    :default_url => "http://s3.amazonaws.com/nwp-badges/badges/medium/test-badge.png"

  validates :name, :presence => true
  validates :description, :presence => true

end
