require "digest"
class User < ActiveRecord::Base
  attr_accessor :password
  has_one :profile
  has_many :articles, -> { order("published_at DESC, title ASC") }
  has_many :replies, through: :articles, source: :comments

  before_save :encrypt_new_password

  validates :email, presence: true
  validates :password, confirmation: true, length: { within: 4..20 },
    presence: true, if: :password_required?

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.encrypted_password == encrypt(password)
  end

  protected
    def encrypt_new_password
      return if password.blank?
      self.encrypted_password = encrypt(password)
    end

    def password_required?
      encrypted_password.blank? || password.present?
    end

    def encrypt(password)
      Digest::SHA1.hexdigest(password)
    end
end
