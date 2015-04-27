class AddCapacityToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :capactiy, :integer
  end
end
