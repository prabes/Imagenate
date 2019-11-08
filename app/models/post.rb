class Post < ApplicationRecord # :nodoc: 
  has_attached_file :image

  validates_attachment :image, content_type: { content_type:
                        ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }
  belongs_to :user
  has_many :comments
end
 