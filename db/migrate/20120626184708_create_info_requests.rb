class CreateInfoRequests < ActiveRecord::Migration
  def change
    create_table :info_requests do |t|
      t.string :title
      t.integer :creator_id

      t.timestamps
    end
  end
end
