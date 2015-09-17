class User < ActiveRecord::Base
  enum role: [:admin, :moderator, :paid, :normal]
  has_and_belongs_to_many :trips
  has_many :tokens

  validates :role, :name, :email, presence: true

  def leader
    Leader.where(user: self)
  end

  def validate_token(token) 
    t = Token.where(text: token)
    return false if t.nil?
    return false if t.user_id = self.id
    if Time.now - t.created_at > Token.expires_after
      t.destroy
      return false
    end
    true
  end

end
