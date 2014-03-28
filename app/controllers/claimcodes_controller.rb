class ClaimcodesController < ApplicationController
  before_filter :is_admin

  def index
    @claimcodes = Claimcode.all
  end

  def edit
    @claimcode = Claimcode.find_by_id params[:id]
  end

  def update
    @claimcode = Claimcode.find_by_id params[:id]
    @claimcode.update_attributes params[:claimcode]
    redirect_to claimcodes_path, notice: "Claimcode #{@claimcode.code} was successfully updated."
  end

  def destroy
    claimcode = Claimcode.find_by_id params[:id]
    claimcode.destroy
    redirect_to claimcodes_path, notice: "#{claimcode.code} was deleted."
  end

end