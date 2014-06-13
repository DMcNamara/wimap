class AddFieldsToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :mobile_user_id, :int
    add_column :tracks, :x, :int
    add_column :tracks, :y, :int
    add_column :tracks, :z, :int
    add_column :tracks, :floor, :int
  end
end
