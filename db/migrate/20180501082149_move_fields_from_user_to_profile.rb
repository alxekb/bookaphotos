class MoveFieldsFromUserToProfile < ActiveRecord::Migration[5.1]
  def up
    remove_column :users, :name
    remove_column :users, :phone
    remove_attachment :users, :avatar

    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :phone, :string
    add_attachment :profiles, :avatar
  end

  def down
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_attachment :users, :avatar

    remove_column :profiles, :first_name
    remove_column :profiles, :last_name
    remove_column :profiles, :phone
    remove_attachment :profiles, :avatar
  end
end
