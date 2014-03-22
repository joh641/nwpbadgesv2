class SubmissionsController < ApplicationController

  def show
    @submission = Submission.find_by_id(params[:id])
  end

  def index
    @submissions = Submission.all
  end

  def create
    @submission = Submission.create
    @submission.name = params[:submission][:name]
    @submission.email = params[:submission][:email]
    @submission.description = params[:submission][:description]
    @submission.badge = Badge.find_by_name(params[:badge])
    @submission.date = Time.now
    @submission.status = "Pending"
    @submission.save
    flash[:notice] = "Your submission was successfully created."
    redirect_to badges_path
  end

  def destroy
    @submission = Submission.find_by_id(params[:id])
    @submission.destroy
    flash[:notice] = "#{@submission.name}'s submission deleted."
    redirect_to submissions_path
  end

  def approve
    @submission = Submission.find_by_id(params[:id])
    @submission.status = "Approved"
    @submission.save
    flash[:notice] = "#{@submission.name}'s submission was approved."
    redirect_to submissions_path 
  end
  
  def reject
    @submission = Submission.find_by_id(params[:id])
    @submission.status = "Rejected"
    @submission.save
    flash[:notice] = "#{@submission.name}'s submission was rejected."
    redirect_to submissions_path
  end

  def assert
    @submission = Submission.find_by_id(params[:id])
    if (@submission.status != "Approved")
      flash[:warning] = "This submission has not been approved"
      redirect_to submissions_path
    end
  end
  
  def push
    @submission = Submission.find_by_id(params[:id])
  end

  def claim
    submission = Submission.create
    submission.name = params[:submission][:name]
    submission.email = params[:submission][:email]
    submission.badge = Badge.find_by_name(params[:badge])
    submission.date = Time.now
    submission.status = "Approved"
    submission.description = "Claim Code"
    submission.save
    redirect_to push_submission_path(submission)
  end
end
