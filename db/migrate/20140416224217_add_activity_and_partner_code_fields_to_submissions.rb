class AddActivityAndPartnerCodeFieldsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :activity, :string
    add_column :submissions, :partner_code, :string
  end
end
