class RemovePersonIdFromAddressesAndAddForeignKeyAssoc < ActiveRecord::Migration
  def up
    remove_column :addresses, :person_id
    change_table :addresses do |t|
      t.references :person, :index => true
    end
  end

  def down
    change_table :addresses do |t|
      t.remove :person_id
    end
  end
end
