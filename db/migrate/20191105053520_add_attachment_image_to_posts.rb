# frozen_string_literal: true

class AddAttachmentImageToPosts < ActiveRecord::Migration[5.2] #:nodoc:
  def self.up
    change_table :posts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :posts, :image
  end
end
