class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :topic, optional: true
  mount_uploader :post_image, PostImageUploader
  
  default_scope { order('rank DESC') }

  validates :title, length: { minimum: 5 },   presence: true
  validates :body,  length: { minimum: 20 },  presence: true

  after_create :create_vote

  def up_votes
    self.votes.where(value: 1).count
  end

  def down_votes
    self.votes.where(value: -1).count
  end

  def points
    self.votes.sum(:value)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / ( 60 * 60 * 24)
    new_rank = points + age_in_days

    update_attribute(:rank, new_rank)
  end

  def create_vote
    self.votes.create(value: 1, post: self, user: self.user)
  end
end
