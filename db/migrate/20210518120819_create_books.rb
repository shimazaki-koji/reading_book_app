class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false, defalut: ""
      t.text :learn, null: false, defalut: ""
      t.string :contents, null: false, defalut: ""
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
