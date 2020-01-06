# frozen_string_literal: true

class Image < ApplicationRecord #:nodoc:
  has_attached_file :image,
                    styles: { thumb: '100x100#', small: '250x250#',
                              medium: '600x600#' }

  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\z}

  belongs_to :imageable, polymorphic: true
end
