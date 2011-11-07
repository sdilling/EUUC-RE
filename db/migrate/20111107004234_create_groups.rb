class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :min_age
      t.integer :max_age
      t.string :service

      t.timestamps
    end
  end
end
