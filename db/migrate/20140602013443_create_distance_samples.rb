class CreateDistanceSamples < ActiveRecord::Migration
  def change
    create_table :distance_samples do |t|
      t.integer :router_id
      t.string :router_mac
      t.float :distance
      t.float :power
      t.timestamp :time

      t.timestamps
    end
  end
end
