require 'bcrypt'

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(self.hashed_password)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end
end
