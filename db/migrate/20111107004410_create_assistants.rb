class CreateAssistants < ActiveRecord::Migration
  def change
    create_table :assistants do |t|
      t.references :person
      t.references :group
      t.integer :svc_month
      t.integer :week_preferred

      t.timestamps
    end
    add_index :assistants, :person_id
    add_index :assistants, :group_id
  end
end
