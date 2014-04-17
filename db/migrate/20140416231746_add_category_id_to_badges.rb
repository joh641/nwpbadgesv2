class AddCategoryIdToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :category_id, :integer
  end
end
