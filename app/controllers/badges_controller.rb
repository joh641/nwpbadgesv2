class BadgesController < ApplicationController
  respond_to :html, :json
  before_filter :is_admin, :only => [:new, :edit, :update, :create, :destroy, :create_claimcode]
  before_filter :categories

  def show
    @badge = Badge.find_by_id params[:id]
  end

  def submit
    @badge = Badge.find_by_id params[:id]
  end

  def index
  end

  def new
    @badge = Badge.new
  end

  def edit
    @badge = Badge.find_by_id params[:id]
  end

  def update
    @badge = Badge.find_by_id params[:id]
    category = Category.find_by_name params[:badge][:category]
    params[:badge].delete :category
    @badge.update_attributes params[:badge]
    @badge.category = category
    @badge.save
    redirect_to badge_path(@badge), notice: "#{@badge.name} was successfully updated."
  end

  def create
    category = Category.find_by_name params[:badge][:category]
    params[:badge].delete :category
    @badge = Badge.new params[:badge]
    @badge.category = category
    if @badge.save
      redirect_to badges_path, notice: "#{@badge.name} was successfully created."
    else
      flash[:warning] = "Badge requires a name and description."
      render action: "new"
    end
  end

  def destroy
    badge = Badge.find_by_id params[:id]
    badge.destroy
    redirect_to badges_path, notice: "#{badge.name} was deleted."
  end

  def assert
    @badge = Badge.find_by_id params[:id]
  end

  def organization
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
