class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}
  after_initialize :reset_session_token!

  has_many(
    :notes,
    class_name: "Note",
    foreign_key: :user_id,
    primary_key: :id
  )
  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password
    @password
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

end
