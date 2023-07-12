class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
   def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
