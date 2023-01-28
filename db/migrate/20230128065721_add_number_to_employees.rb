class AddNumberToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_index :employees, [:number, :account], unique: true
  end
end
