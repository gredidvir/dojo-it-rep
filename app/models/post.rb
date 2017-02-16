class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  mount_uploader :post_image, PostImageUploader
  
  default_scope { order('created_at DESC') }
  # scope :ordered_by_title, -> { reorder(title: :asc) }
  # scope :ordered_by_reverse, -> {reorder(created_at: :asc)}

  validates :title, length: { minimum: 5 },   presence: true
  validates :body,  length: { minimum: 20 },  presence: true
  validates :topic, presence: true
  validates :user,  presence: true

end
