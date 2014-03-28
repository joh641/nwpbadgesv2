class ChangeClaimcodeInBadges < ActiveRecord::Migration
  def up
    change_column :badges, :claimcode, :boolean, default: false
  end

  def down
    change_column :badges, :claimcode, :string
  end
end
