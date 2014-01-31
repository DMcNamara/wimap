class AddSiteIdToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :site_id, :integer
  end
end
