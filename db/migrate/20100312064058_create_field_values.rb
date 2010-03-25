class CreateFieldValues < ActiveRecord::Migration
  def self.up
    create_table :field_values do |t|
      t.integer :form_field_id
      t.string  :field_value
      t.integer :patient_id
      t.timestamps
    end
  end

  def self.down
    drop_table :field_values
  end
end
