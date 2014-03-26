# Load the rails application
require File.expand_path('../application', __FILE__)

environment_variables = File.join(Rails.root, 'config', 'environment_variables.rb')
load(environment_variables) if File.exists?(environment_variables)

ENV['root'] = 'http://badge.nwp.org'

# Initialize the rails application
Nwpbadges::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'nwp.org',
  :enable_starttls_auto => true
}