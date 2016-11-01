class AddEmailPermissionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email_favorites, :boolean, default: true
  end
end
