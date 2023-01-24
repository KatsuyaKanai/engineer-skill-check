class AddColumnEmployees < ActiveRecord::Migration[6.1]
  def up
    add_column :employees, :notification_posting_authority, :boolean
  end
end
