class Badge < ActiveRecord::Base
  
  attr_accessible :name, :image, :description, :claimcode, :criteria, :category

  scope :category_search, lambda { |category| joins(:category).where("categories.name = ?", category) }

  has_many :claimcodes, dependent: :destroy
  has_many :submissions, dependent: :destroy
  belongs_to :category

  has_attached_file :image,
                    :storage => :s3,
                    :s3_credentials => S3_CREDENTIALS,
                    :path => "/badges/:style/:filename",
                    :styles => { :medium => "165x165>", :thumb => "100x100>" }, 
                    :default_url => "http://s3.amazonaws.com/nwp-badges/badges/medium/test-badge.png"

  validates :name, :presence => true
  validates :description, :presence => true

  def find_code(code)
    claimcodes.each do |claimcode|
      return claimcode if claimcode.code == code
    end
    nil
  end

  def find_approved_submission(email)
    submissions.each do |submission|
      return submission if submission.email == email && submission.approved?
    end
    nil
  end

end
