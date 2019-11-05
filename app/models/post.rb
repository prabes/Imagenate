class Post < ApplicationRecord
  has_attached_file :image
  # validates_format_of :content_type, with: /|Aimage/, message: "must be a picture"

validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  # image_updated_at 
end
 