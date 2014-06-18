class CreateNavpoints < ActiveRecord::Migration
  def change
    create_table :navpoints do |t|
      t.float :x
      t.float :y
      t.float :z
      t.float :range
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
