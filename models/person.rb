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

  def self.authenticate(email, password)
    person = find_by_email(email)

    if person && person.password_hash == BCrypt::Engine.hash_secret(password, person.password_salt)
      person
    else
      nil
    end
  end

  def user_details
    {
      :first_name  => self.first_name,
      :middle_name => self.middle_name,
      :last_name   => self.last_name,
      :gender      => self.gender,
      :email       => self.email
    }
  end
end
