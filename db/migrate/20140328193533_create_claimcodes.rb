class CreateClaimcodes < ActiveRecord::Migration
  def change
    create_table :claimcodes do |t|
      t.belongs_to :badge
      t.string :code
      t.boolean :claimed, default: false
      t.timestamps
    end
  end
end
