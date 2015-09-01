require 'bcrypt'

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validate :password_required

  def password
    @password ||= BCrypt::Password.new(self.hashed_password)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  private

  def password_required
    # OPTION 1: unrefactored
    # if the record is invalid, i need to add a error to the activerecord errors collection
    # using: errors.add(:field-name, "message about the error")
    if @raw_password && @raw_password.length == 0
      errors.add(:password, "is required.")
    end

    # edge if the user is new and they didn't set a password
    if new_record? && !@raw_password
      errors.add(:password, "is required.")
    end

    # OPTION 2: refactored
    # when to run the validator
    # if new_record? || @raw_password
    #   # what are we validating
    #   unless @raw_password && @raw_password.length > 0
    #     errors.add(:password, "is required.")
    #   end
    # end
  end
end
