class SubmissionsController < ApplicationController
  respond_to :html, :json
  before_filter :is_admin, :only => [:index, :destroy, :approve, :reject]

  def show
    @submission = Submission.find_by_id params[:id]
  end

  def index
    @submissions = Submission.all.reverse
  end

  def create
    url = params[:submission][:url]
    params[:submission].delete :url if url == ""
    @submission = Submission.new params[:submission]
    @submission.badge = Badge.find_by_id params[:badge]
    @submission.status = Submission::PENDING
    if @submission.save
      Notifier.new_submission(@submission).deliver
      educator_innovator(@submission) if Submission.has_all?(@submission)
      redirect_to badges_path, notice: "Your submission was successfully created."
    else
      flash[:warning] = "URL must be of form http://URL"
      redirect_to :back
    end
  end

  def destroy
    @submission = Submission.find_by_id params[:id]
    @submission.destroy
    redirect_to :back, notice: "#{@submission.name}'s submission deleted."
  end

  def approve
    @submission = Submission.find_by_id params[:id]
    @submission.status = Submission::APPROVED
    @submission.save
    Notifier.approve_submission(@submission).deliver
    redirect_to :back, notice: "#{@submission.name}'s submission was approved."
  end
  
  def reject
    @submission = Submission.find_by_id params[:id]
    @submission.status = Submission::REJECTED
    @submission.reasons = params[:reasons]
    @submission.save
    Notifier.reject_submission(@submission).deliver
    redirect_to :back, notice: "#{@submission.name}'s submission was rejected."
  end

  def assert
    @submission = Submission.find_by_id params[:id]
    if not @submission.approved?
      flash[:warning] = "This submission has not been approved"
      redirect_to submissions_path
    end
  end

  def claim
    @submission = Submission.find_by_id params[:id]
    @badge = @submission.badge
  end

  def claim_create
    submission = Submission.find_by_id params[:id]
    if submission.name || submission.email
      flash[:warning] = "You do not have permission to access"
      redirect_to root_path and return
    else
      submission.name = params[:name]
      submission.email = params[:email]
      submission.save
      Notifier.approve_submission(submission).deliver
      educator_innovator(submission) if Submission.has_all?(submission)
      redirect_to push_submission_path(submission)
    end
  end
  
  def push
    @submission = Submission.find_by_id params[:id]
  end

  private

  def educator_innovator(submission)
    @submission = Submission.new
    @submission.name = submission.name
    @submission.email = submission.email
    @submission.badge = Badge.find_by_name "Educator Innovator"
    @submission.status = Submission::APPROVED
    @submission.description = "Earned all badges"
    @submission.save
    Notifier.educator_innovator(@submission).deliver
  end

end
