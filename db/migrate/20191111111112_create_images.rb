# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[5.2] #:nodoc:
  def change
    create_table :images do |t|
      t.bigint :imageable_id
      t.string :imageable_type
      t.timestamps
    end
  end
end
