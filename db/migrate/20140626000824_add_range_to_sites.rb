class AddRangeToSites < ActiveRecord::Migration
  def change
    add_column :sites, :range, :float
  end
end
