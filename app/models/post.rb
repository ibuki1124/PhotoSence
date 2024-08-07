class Post < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_one_attached :vision_image
  
  validates :title, presence: true, length: {maximum: 25}
  validates :vision_image, presence: true
  
  def get_vision_image(width, height)
    unless vision_image.attached?
      file_path = Rails.root.join("app/assets/images/no.jpg")
      vision_image.attach(io: File.open(file_path), filename: "no-image.jpg", content_type: "image/jpeg")
    end
    vision_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
