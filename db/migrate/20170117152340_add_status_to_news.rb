class AddStatusToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :status, :integer, default: 1
  end
end
