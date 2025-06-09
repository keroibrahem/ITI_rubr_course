class Article < ApplicationRecord
  belongs_to :user
  has_many :reports, dependent: :destroy
  has_one_attached :image

  enum :status, {
    draft: 0,
    published: 1,
  deleted: 2,
    archived: 3
  }

  validates :title, presence: true
  validates :body, presence: true

  scope :published_articles, -> { where(status: :published) }
  scope :by_user, ->(user) { where(user: user) }
  scope :not_deleted, -> { where.not(status: :deleted) }

  # Callback to auto-archive articles with 3+ reports
  after_update :check_reports_count

  private

  def check_reports_count
    if reports_count >= 3 && !archived?
      update_column(:status, :archived)
    end
  end
end
