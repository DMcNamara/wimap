class CreateRouters < ActiveRecord::Migration
  def change
    create_table :routers do |t|
      t.integer :site_id
      t.decimal :x
      t.decimal :y
      t.decimal :z
      t.string :ssid
      t.string :uid
      t.decimal :power

      t.timestamps
    end
  end
end
