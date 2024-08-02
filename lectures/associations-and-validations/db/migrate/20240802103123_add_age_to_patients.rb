class AddAgeToPatients < ActiveRecord::Migration[7.1]
  def change
    # add_column :table_name, :column_name, :column_type
    add_column :patients, :age, :integer
  end
end
