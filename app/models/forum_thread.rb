class ForumThread < ApplicationRecord
  belongs_to :user
  has_many :forum_posts

  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true

  def sticky?
    sticky_order != 100
  end

  def pinit!
    self.sticky_order = 1
    self.save
  end
end
