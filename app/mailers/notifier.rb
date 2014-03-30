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
    mail subject: "A new submission was created for #{@badge}"
  end

end
