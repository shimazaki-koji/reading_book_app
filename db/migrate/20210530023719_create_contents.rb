class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.text :write_down, null: false, defalut: ""
      t.text :wrap_up, null: false, defalut: ""
      t.text :action_plan, defalut: ""
      t.references :book, foreign_key: true
      t.timestamps
    end
  end
end
