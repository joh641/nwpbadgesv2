class ChangeClaimcodeInBadges < ActiveRecord::Migration
  def up
    remove_column :badges, :claimcode
    add_column :badges, :claimcode, :boolean, default: false
  end

  def down
    remove_column :badges, :claimcode
    add_column :badges, :claimcode, :string
  end
end
