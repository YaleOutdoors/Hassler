class User < ActiveRecord::Base
  validates :role, :name, :email, presence: true
end
