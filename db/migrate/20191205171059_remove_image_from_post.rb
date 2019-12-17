class RemoveImageFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :image_content_type, :string
    remove_column :posts, :image_file_name, :string
    remove_column :posts, :image_file_size, :bigint
    remove_column :posts, :image_updated_at, :timestamps
  end
end
