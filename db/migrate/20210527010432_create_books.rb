class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :isbn, null: false
      t.string :title
      t.string :publisher
      t.integer :pubdate
      t.string :cover
      t.string :author

      t.timestamps
    end
  end
end
