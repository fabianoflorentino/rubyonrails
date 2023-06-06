class AddPercentageChange24hToCoins < ActiveRecord::Migration[7.0]
  def change
    add_column :coins, :percentagechange24h, :string
  end
end
