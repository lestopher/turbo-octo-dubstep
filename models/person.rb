class Person < ActiveRecord::Base
  has_many :addresses
  attr_accessible :first_name, :middle_name, :last_name, :gender, :email, :person_id
  attr_accessor :password

  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
