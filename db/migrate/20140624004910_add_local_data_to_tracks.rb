class AddLocalDataToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :x, :float
    add_column :tracks, :y, :float
    add_column :tracks, :z, :float
    add_column :tracks, :x_conf, :float
    add_column :tracks, :y_conf, :float
    add_column :tracks, :z_conf, :float
    add_column :tracks, :local_timestamp, :timestamp
  end
end
