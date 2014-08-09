class AddTxPowerToRouters < ActiveRecord::Migration
  def change
    add_column :routers, :tx_power, :decimal
  end
end
