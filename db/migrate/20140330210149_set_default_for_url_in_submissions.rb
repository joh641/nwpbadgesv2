class SetDefaultForUrlInSubmissions < ActiveRecord::Migration
  def change
    change_column :submissions, :url, :string, default: "#{ENV['root']}"
  end
end
