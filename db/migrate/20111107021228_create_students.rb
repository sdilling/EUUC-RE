class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :person
      t.references :group

      t.timestamps
    end
    add_index :students, :person_id
    add_index :students, :group_id
  end
end
