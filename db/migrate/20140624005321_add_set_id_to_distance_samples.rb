class AddSetIdToDistanceSamples < ActiveRecord::Migration
  def change
    add_column :distance_samples, :set_id, :integer
  end
end
