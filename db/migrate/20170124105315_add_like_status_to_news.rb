class AddLikeStatusToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :like_status, :integer
  end
end
