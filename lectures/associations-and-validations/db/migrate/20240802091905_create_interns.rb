class CreateInterns < ActiveRecord::Migration[7.1]
  def change
    create_table :interns do |t|
      t.string :first_name
      t.string :last_name
      # t.integer :doctor_id # WE DO NOT DO THIS!
      t.references :doctor, foreign_key: true

      t.timestamps # Create two columns: created_at && updated_at
    end
  end
end
