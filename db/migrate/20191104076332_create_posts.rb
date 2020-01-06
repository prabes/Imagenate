# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2] #:nodoc:
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
