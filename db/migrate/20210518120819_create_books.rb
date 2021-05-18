class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :book_title, null: false, defalut: ""
      t.text :book_learn, null: false, defalut: ""
      t.string :book_contents, null: false, defalut: ""
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
