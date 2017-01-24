class AddFeedIdToNews < ActiveRecord::Migration[5.0]
  def change
    add_reference :news, :feed, foreign_key: true
  end
end
