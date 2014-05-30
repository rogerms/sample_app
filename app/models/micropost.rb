class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  default_scope order: 'microposts.created_at DESC'
  
  
 def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
  user_id: user.id)
  end
end




=begin
attr accessible :content
belongs to :user
validates :user id, presence: true
default scope order: 'microposts.created at DESC'

def self.from users followed by(user)
followed user ids = "SELECT followed id FROM relationships
WHERE follower id = :user id"
where("user id IN (#{followed user ids}) OR user id = :user id",
user id: user.id)
end
=end

