class Vote < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true

  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }

  after_save :update_post

  private

  def update_post
    post.update_rank
  end
end
