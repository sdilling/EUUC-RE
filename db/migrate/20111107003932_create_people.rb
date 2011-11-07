class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :home_phone
      t.string :cell_phone
      t.string :work_phone
      t.string :email
      t.string :preferred_contact_method
      t.string :gender_identification
      t.date :birthdate
      t.boolean :active
      t.text :public_note
      t.text :admin_note
      t.string :family_role
      t.references :family

      t.timestamps
    end
    add_index :people, :family_id
  end
end
