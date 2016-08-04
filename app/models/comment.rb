class Comment < ActiveRecord::Base
  belongs_to :article

  validates :name, :email, :body, presence: true
  validate :article_should_be_published

  def article_should_be_published
    if article && !article.published?
      errors.add(:article_id, "is not published yet")
    end
  end
end
