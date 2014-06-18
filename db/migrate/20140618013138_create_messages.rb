class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.string :icon
      t.string :body
      t.time :msg_time
      t.integer :navpoint_id

      t.timestamps
    end
  end
end
