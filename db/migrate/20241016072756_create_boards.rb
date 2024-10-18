class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
