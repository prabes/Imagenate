# frozen_string_literal: true

# creates table for comments
class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :post, foreign_key: true
      t.references :user
      t.text :body
      t.timestamps
    end
  end
end
