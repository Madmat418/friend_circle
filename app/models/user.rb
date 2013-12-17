# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  reset_token     :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :password
  validates :email, :password_digest, :session_token, :presence => true
  validates :password, :length => { :minimum => 6 }, :on => :create
  before_validation :ensure_session_token
  validates :email, :uniqueness => { :message => " already in use"}

  has_one(
    :buddy_circle,
    :class_name => "BuddyCircle",
    :primary_key => :id,
    :foreign_key => :owner_id
  )

  has_many :friends, :through => :buddy_circle, :source => :members
  has_many :friendships, :through => :buddy_circle, :source => :buddy_circle_memberships

  attr_reader :password

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def self.find_by_credentials(email, pw)
    user = User.find_by_email(email)
    user && user.is_password?(pw) ? user : nil
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def reset_reset_token!
    self.reset_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.reset_token
  end

  private
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

end
