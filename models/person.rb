class Person < ActiveRecord::Base
  attr_accessible :first_name, :middle_name, :last_name, :gender, :email
end
