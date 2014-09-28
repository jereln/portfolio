class Article < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  scope :published, -> { where(published: true) }

  def publish!
    published = true
    save!
    end

    def authored_by?(user)
      author == user
    end
end
