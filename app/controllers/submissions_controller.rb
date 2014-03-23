class SubmissionsController < ApplicationController
  respond_to :html, :json
  before_filter :is_admin, :only => [:index, :destroy, :approve, :reject]
  before_filter :signed_in, :only => [:my, :create, :push]
  before_filter :is_admin_or_owner, :only => [:show]

  def is_admin_or_owner
    submission = Submission.find_by_id params[:id]
    if not (is_admin? or current_user == submission.user)
      flash[:error] = "Error: You do not have permission to access"
      redirect_to root_path
      return
    end
    return true    
  end

  def show
    @submission = Submission.find_by_id params[:id]
  end

  def index
    @submissions = Submission.all
  end

  def my
    @submissions = current_user.submissions
  end

  def create
    @submission = Submission.create params[:submission]
    @submission.user = current_user
    @submission.badge = Badge.find_by_id params[:badge]
    @submission.status = Submission::PENDING
    @submission.save
    flash[:notice] = "Your submission was successfully created."
    redirect_to badges_path
  end

  def destroy
    @submission = Submission.find_by_id params[:id]
    @submission.destroy
    flash[:notice] = "#{@submission.user.name}'s submission deleted."
    redirect_to :back
  end

  def approve
    @submission = Submission.find_by_id params[:id]
    @submission.status = Submission::APPROVED
    @submission.save
    flash[:notice] = "#{@submission.user.name}'s submission was approved."
    redirect_to :back 
  end
  
  def reject
    @submission = Submission.find_by_id params[:id]
    @submission.status = Submission::REJECTED
    @submission.save
    flash[:notice] = "#{@submission.user.name}'s submission was rejected."
    redirect_to :back
  end

  def assert
    @submission = Submission.find_by_id params[:id]
    if not @submission.approved?
      flash[:warning] = "This submission has not been approved"
      redirect_to submissions_path
    end
  end
  
  def push
    @submission = Submission.find_by_id params[:id]
  end

end
