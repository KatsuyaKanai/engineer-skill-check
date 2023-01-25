class RenameContextColumnToNotifications < ActiveRecord::Migration[6.1]
  def change
    rename_column :notifications, :context, :content
  end
end
