class Article < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :comments
  scope :published, -> { where(published: true) }

  def authored_by?(user)
    author == user
  end
end
