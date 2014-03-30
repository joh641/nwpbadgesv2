class BadgesController < ApplicationController
  respond_to :html, :json
  before_filter :is_admin, :only => [:new, :edit, :update, :create, :destroy]
  before_filter :categories

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
    redirect_to badge_path(@badge), notice: "#{@badge.name} was successfully updated."
  end

  def create
    @badge = Badge.create params[:badge]
    redirect_to badges_path, notice: "#{@badge.name} was successfully created."
  end

  def destroy
    badge = Badge.find_by_id params[:id]
    badge.destroy
    redirect_to badges_path, notice: "#{badge.name} was deleted."
  end

  def assert
    @badge = Badge.find_by_id params[:id]
  end

  def claim
    badge = Badge.find_by_id params[:id]
    code = params[:claim][:claimcode]
    claimcode = badge.find_code code
    if claimcode
      if claimcode.claimed?
        flash[:warning] = "Already Claimed: #{code}"
        redirect_to :back and return
      else
        submission = Submission.new
        submission.badge = badge
        submission.status = Submission::APPROVED
        submission.description = "Claim Code"
        submission.save
        claimcode.claimed = true
        claimcode.save
        redirect_to claim_submission_path(submission), :method => :get
      end
    else
      flash[:warning] = "Invalid Claim Code: #{code}"
      redirect_to :back and return
    end
  end

  def create_claimcode
    badge = Badge.find_by_id params[:id]
    claimcode = Claimcode.new
    claimcode.code = params[:claimcode]
    claimcode.badge = badge
    claimcode.save
    redirect_to :back, notice: "Claimcode #{claimcode.code} successfully created"
  end

end
