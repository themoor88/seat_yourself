class RemoveCapactiyFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :capactiy, :integer
  end
end
