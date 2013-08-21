class AddPasswordHashAndSaltToPerson < ActiveRecord::Migration
  def change
    add_column :people, :password_hash, :string
    add_column :people, :password_salt, :string
  end
end
