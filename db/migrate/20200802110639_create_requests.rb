class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :requesting_id
      t.integer :requested_id
    end
  end
end
