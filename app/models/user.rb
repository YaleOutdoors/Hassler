class User < ActiveRecord::Base
  enum role: [:admin, :moderator, :normal]

  validates :role, :name, :email, presence: true
end
