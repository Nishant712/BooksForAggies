class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :category
      t.string :isbn_no
      t.string :edition
      t.text :abstract
      t.string :publisher
      t.string :descriptors
      t.integer :user_id

      t.timestamps
    end
  end
end
