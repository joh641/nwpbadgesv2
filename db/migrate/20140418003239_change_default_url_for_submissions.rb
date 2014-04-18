class ChangeDefaultUrlForSubmissions < ActiveRecord::Migration
  def change
    change_column :submissions, :url, :string, default: "http://badges.educatorinnovator.org"
  end
end
