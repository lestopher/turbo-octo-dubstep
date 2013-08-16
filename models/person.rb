class Person < ActiveRecord::Base
  has_many :addresses
  attr_accessible :first_name, :middle_name, :last_name, :gender, :email
end
