class CreateLibrariesUsers < ActiveRecord::Migration
  def change
    create_table :libraries_users do |t|
      t.references :user, index: true
      t.references :library, index: true

      t.timestamps null: false
    end
    add_foreign_key :libraries_users, :users
    add_foreign_key :libraries_users, :libraries
  end
end
