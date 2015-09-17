require 'securerandom'

class Token < ActiveRecord::Base
  belongs_to :user


  validates :text, :user_id, presence: true
  validates :text, uniqueness: true

  def self.expires_after
    4.hours
  end

  def self.generate
    SecureRandom.base64(64)
  end

  def self.generate_for(user_id)
    t = Token.new
    t.user_id = user_id
    while true
      t.text = Token.generate
      break if t.save
    end
    t
  end

  def self.authenticate_user(token_text)
    t = Token.where(text: token_text);
    User.find(t.user_id)
  end

end
