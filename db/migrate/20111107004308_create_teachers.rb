class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.references :person
      t.references :group
      t.integer :svc_month

      t.timestamps
    end
    add_index :teachers, :person_id
    add_index :teachers, :group_id
  end
end
