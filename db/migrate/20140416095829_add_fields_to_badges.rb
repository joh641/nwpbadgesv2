class AddFieldsToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :criteria, :text
    add_column :badges, :partner_code, :string
  end
end
