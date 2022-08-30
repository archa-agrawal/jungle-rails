class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness:true, presence:true
  validates :password, length: { within: 4..16 }

  def self.authenticate_with_credentials(email,password)
    email.downcase!
    email_strip = email.strip
    user = nil
    if email_strip
      user = User.find_by_email(email_strip)
    else
      user = User.find_by_email(email)
    end
    
    if user && user.authenticate(password)
      return user
    end
    nil
  end
end
