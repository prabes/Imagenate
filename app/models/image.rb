# frozen_string_literal: true

class Image < ApplicationRecord
  has_attached_file :image, styles: { small: '200x200', medium: '700>', thumb: '100x100>' }

  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\z}

  belongs_to :imageable, polymorphic: true
end
