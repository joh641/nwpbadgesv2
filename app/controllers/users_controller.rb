class UsersController < ApplicationController
  before_filter :is_admin

  def index
    @users = User.all
  end

  def make_admin
    user = User.find_by_id params[:id]
    user.category = 1
    user.save
    redirect_to :back, notice: "#{user.name} was successfully made an admin."
  end

  def remove_admin
    user = User.find_by_id params[:id]
    user.category = 0
    user.save
    redirect_to :back, notice: "#{user.name} was successfully removed as admin."
  end

end