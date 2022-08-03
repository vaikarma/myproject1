class AddFieldnameToCarts < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :subtotal, :decimal
  end
end
