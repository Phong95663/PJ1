class AddAttrsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string, unique: true, null: false
    add_column :users, :address, :text
    add_column :users, :permision, :integer, default: 3
  end
end
