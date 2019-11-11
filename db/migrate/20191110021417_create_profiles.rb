# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :username
      t.string :website
      t.text :bio
      t.string :phone_number
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
