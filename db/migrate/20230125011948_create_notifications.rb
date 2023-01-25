class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :employee, null: false
      t.string :title, null: false
      t.string :context, null: false

      t.timestamps
    end
    add_foreign_key :notifications, :employees
  end
end
