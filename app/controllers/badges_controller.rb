class BadgesController < ApplicationController
  respond_to :html, :json
  before_filter :is_admin, :only => [:new, :edit, :update, :create, :destroy]

  def show
    @badge = Badge.find_by_id params[:id]
  end

  def submit
    @badge = Badge.find_by_id params[:id]
  end

  def index
    @badges = Badge.order 'name ASC'
  end

  def new
    @badge = Badge.new
  end

  def edit
    @badge = Badge.find_by_id params[:id]
  end

  def update
    @badge = Badge.find_by_id params[:id]
    @badge.update_attributes params[:badge]
    flash[:notice] = "#{@badge.name} was successfully updated."
    redirect_to badge_path(@badge)
  end

  def create
    @badge = Badge.create params[:badge]
    flash[:notice] = "#{@badge.name} was successfully created."
    redirect_to badges_path
  end

  def destroy
    badge = Badge.find_by_id params[:id]
    badge.destroy
    flash[:notice] = "#{badge.name} was deleted."
    redirect_to badges_path
  end

  def assert
    @badge = Badge.find_by_id params[:id]
  end

  def claim
    badge = Badge.find_by_id params[:id]
    code = params[:claim][:claimcode]
    if badge.claimcode == code
      submission = Submission.new
      submission.badge = badge
      submission.status = Submission::APPROVED
      submission.description = "Claim Code"
      submission.save
      redirect_to claim_submission_path(submission), :method => :get
    else
      flash[:warning] = "Invalid Claim Code: #{code}"
      redirect_to :back and return
    end
  end

end
