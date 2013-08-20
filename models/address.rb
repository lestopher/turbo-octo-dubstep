class Address < ActiveRecord::Base
  belongs_to :person
  attr_accessible :street_line_1, :street_line_2, :zip_code, :city, :state, :country, :person_id
end