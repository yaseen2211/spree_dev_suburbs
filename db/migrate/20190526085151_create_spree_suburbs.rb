class CreateSpreeSuburbs < ActiveRecord::Migration[5.2]
  def up
    create_table :spree_suburbs do |t|
      t.string :name
      t.string :abbr
      t.belongs_to :state
      t.timestamps
    end
  end

  def down
    drop_table :spree_suburbs
  end
end
