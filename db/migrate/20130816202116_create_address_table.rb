class CreateAddressTable < ActiveRecord::Migration
  def up
    create_table :addresses do |t|
      t.string :street_line_1
      t.string :street_line_2
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :country
      t.string :person_id
    end
  end

  def down
    drop_table :addresses
  end
end
