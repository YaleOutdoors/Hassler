class Trip < ActiveRecord::Base
  belongs_to :leader
  has_and_belongs_to_many :users
  def signup user
    self.users << user
  end

end
