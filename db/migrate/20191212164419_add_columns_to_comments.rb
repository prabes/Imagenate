# frozen_string_literal: true

# add columns to comments for nested comments (polymorphic)
class AddColumnsToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
  end
end
