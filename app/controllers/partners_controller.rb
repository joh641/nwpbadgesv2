class PartnersController < ApplicationController
  before_filter :is_admin

  def index
    @partners = Partner.all
  end

  def create
    partner = Partner.create params[:partner]
    redirect_to :back, notice: "Partner #{partner.name} successfully created"
  end

  def edit
    @partner = Partner.find_by_id params[:id]
  end

  def update
    @partner = Partner.find_by_id params[:id]
    @partner.update_attributes params[:partner]
    redirect_to partners_path, notice: "Partner #{@partner.name} was successfully updated."
  end

  def destroy
    partner = Partner.find_by_id params[:id]
    partner.destroy
    redirect_to partners_path, notice: "#{partner.name} was deleted."
  end

end