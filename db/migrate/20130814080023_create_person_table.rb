class CreatePersonTable < ActiveRecord::Migration
  def up
    create_table :person do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.string :email
    end
  end

  def down
    drop_table :person
  end
end
