class RemoveFedsdlssdNameFromusers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :type
  end
end
