class Post < ApplicationRecord
  has_many :comments
  belongs_to :user

  default_scope { order('created_at DESC') }
  # scope :ordered_by_title, -> { reorder(title: :asc) }
  # scope :ordered_by_reverse, -> {reorder(created_at: :asc)}
end
