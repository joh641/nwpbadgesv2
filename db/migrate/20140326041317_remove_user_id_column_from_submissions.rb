class RemoveUserIdColumnFromSubmissions < ActiveRecord::Migration
  def change
    remove_column :submissions, :user_id
  end
end
