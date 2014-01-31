class AddFrequencyToRouters < ActiveRecord::Migration
  def change
    add_column :routers, :frequency, :decimal
  end
end
