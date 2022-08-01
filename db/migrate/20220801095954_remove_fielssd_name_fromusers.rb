class RemoveFielssdNameFromusers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :customer
  end
end
