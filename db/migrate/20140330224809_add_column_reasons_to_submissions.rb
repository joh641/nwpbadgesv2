class AddColumnReasonsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :reasons, :text
  end
end
