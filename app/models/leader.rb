class Leader < ActiveRecord::Base
  has_many :trips
  belongs_to :user

  def full_profile
    self.as_json.merge!(self.user.as_json)
  end

end
