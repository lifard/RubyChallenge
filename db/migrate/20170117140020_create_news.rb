class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string   :name
      t.string   :url
      t.string   :guid
      t.text     :content
      t.datetime :published_at

      t.timestamps
    end
  end
end
