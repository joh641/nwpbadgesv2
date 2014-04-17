class RemovePartnerCodeFromBadge < ActiveRecord::Migration
  def change
    remove_column :badges, :partner_code
  end
end
