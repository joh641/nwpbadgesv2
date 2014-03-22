class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :status
      t.text :description
      t.belongs_to :badge
      t.belongs_to :user
      t.timestamps
    end
  end
end
