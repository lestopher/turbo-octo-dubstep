class Address < ActiveRecord::Base
  has_and_belongs_to_many :person
  attr_accessible :street_line_1, :street_line_2, :zip_code, :city, :state, :country, :person_id
end