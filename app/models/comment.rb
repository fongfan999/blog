class Comment < ActiveRecord::Base
  belongs_to :article

  validates :name, :email, :body, presence: true
  validate :article_should_be_published

  after_create :send_comment_email

  def article_should_be_published
    if article && !article.published?
      errors.add(:article_id, "is not published yet")
    end
  end

  private

  def send_comment_email
    Notifier.comment_added(self).deliver_now
  end
end
