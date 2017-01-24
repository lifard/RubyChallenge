class CreateKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :keywords do |t|
      t.string  :content,  null: false
      t.integer :category, null: false
      t.integer :rating,   default: 0

      t.timestamps
    end
  end
end
