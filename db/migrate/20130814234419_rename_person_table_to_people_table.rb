class RenamePersonTableToPeopleTable < ActiveRecord::Migration
  def up
    rename_table :person, :people
  end

  def down
    rename_table :people, :person
  end
end
