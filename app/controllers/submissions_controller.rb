class SubmissionsController < ApplicationController
  respond_to :html, :json
  before_filter :is_admin, :only => [:index, :destroy, :approve, :reject]

  def show
    @submission = Submission.find_by_id params[:id]
  end

  def index
    @submissions = Submission.all
  end

  def create
    @submission = Submission.create params[:submission]
    @submission.badge = Badge.find_by_id params[:badge]
    @submission.status = Submission::PENDING
    @submission.save
    flash[:notice] = "Your submission was successfully created."
    redirect_to badges_path
  end

  def destroy
    @submission = Submission.find_by_id params[:id]
    @submission.destroy
    flash[:notice] = "#{@submission.name}'s submission deleted."
    redirect_to :back
  end

  def approve
    @submission = Submission.find_by_id params[:id]
    @submission.status = Submission::APPROVED
    @submission.save
    flash[:notice] = "#{@submission.name}'s submission was approved."
    redirect_to :back 
  end
  
  def reject
    @submission = Submission.find_by_id params[:id]
    @submission.status = Submission::REJECTED
    @submission.save
    flash[:notice] = "#{@submission.name}'s submission was rejected."
    redirect_to :back
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
      redirect_to push_submission_path(submission)
    end
  end
  
  def push
    @submission = Submission.find_by_id params[:id]
  end

end
