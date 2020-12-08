class Place < ApplicationRecord
  belongs_to :user
  has_many :likes

  def liked_by_user?(user)
    likes.where(user: user).present?
  end

  def like_of_user(user)
    likes.find_by(user: user)
  end
end
