class CreateRegistrationForms < ActiveRecord::Migration
  def self.up
    create_table :registration_forms do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :registration_forms
  end
end
