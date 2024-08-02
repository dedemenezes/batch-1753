class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps # Create two columns: created_at && updated_at
    end
  end
end
