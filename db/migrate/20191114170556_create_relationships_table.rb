# frozen_string_literal: true

class CreateRelationshipsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :follower,  foreign_key: { to_table: :users }
      t.references :following, foreign_key: { to_table: :users }
    end
  end
end
