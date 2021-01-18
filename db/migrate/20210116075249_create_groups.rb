class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :group_type
      t.string :status
      t.timestamps
    end
  end
end
