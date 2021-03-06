# frozen_string_literal: true

class AddImageAttachmentToImages < ActiveRecord::Migration[5.2] #:nodoc:
  def self.up
    change_table :images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :images, :image
  end
end
