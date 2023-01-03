class User < ApplicationRecord
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email.strip.downcase)
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end

	# Verify that email field is not blank and that it doesn't already exist in the db (prevents duplicates):
	validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { in: 8..16 }
  validates :password_confirmation, presence: true, length: { in: 8..16 }
end
