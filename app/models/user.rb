class User < ActiveRecord::Base
  enum role: [:admin, :moderator, :paid, :normal]
  has_and_belongs_to_many :trips

  validates :role, :name, :email, presence: true

  def leader
    Leader.where(user: self)
  end

end
