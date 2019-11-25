class Image < ApplicationRecord
   has_attached_file :image, styles: {small: "200x200", medium: "700>", thumb: "100x100>" }

  validates_attachment :image, content_type: { content_type:
                        ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }
   belongs_to :imageable, polymorphic: true 

   # def url(thumb)  
   #    image.url(:thumb)
   # end


end
