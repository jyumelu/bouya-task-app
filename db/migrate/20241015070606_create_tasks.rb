class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      # t.references は user_id, board_id を追加して DB に紐づけている
      t.references :user, null: false
      t.references :board, null: false
      t.string :title, null: false
      t.text :summary, null: false
      t.text :detail
      t.timestamps
    end
  end
end
