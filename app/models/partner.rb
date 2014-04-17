class Partner < ActiveRecord::Base
  attr_accessible :name, :code, :email

  def self.hash
    email_hash = Hash.new "educatorinnovator@nwp.org"
    self.all.each { |partner| email_hash[partner.code] = partner.email }
    email_hash
  end

end
