class AddColumnsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :name, :string
    add_column :submissions, :email, :string
  end
end
