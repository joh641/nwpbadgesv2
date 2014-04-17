class Notifier < ActionMailer::Base
  default from: "educatorinnovator@nwp.org"
  default to: "educatorinnovator@nwp.org"

  def approve_submission(submission)
    @name = submission.name
    @email = submission.email
    @badge = submission.badge.name
    @url = "#{ENV['root']}/submissions/#{submission.id}/push"
    mail to: @email, subject: "Your submission for #{@badge} has been approved"
  end

  def reject_submission(submission)
    @name = submission.name
    @email = submission.email
    @reasons = submission.reasons
    @badge = submission.badge.name
    mail to: @email, subject: "Your submission for #{@badge} has been rejected"
  end

  def new_submission(submission)
    @name = submission.name
    @email = submission.email
    @badge = submission.badge.name
    @url = "#{ENV['root']}/submissions/#{submission.id}"
    mail to: get_partner_email(submission), subject: "A new submission was created for #{@badge}"
  end

  def educator_innovator(submission)
    @name = submission.name
    @email = submission.email
    @url = "#{ENV['root']}/submissions/#{submission.id}/push"
    mail to: @email, subject: "You earned the Educator Innovator badge!"
  end

  def get_partner_email(submission)
    Partner.hash[submission.partner_code]
  end

end
