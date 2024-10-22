# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  deadline   :datetime         not null
#  detail     :text
#  summary    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#  index_tasks_on_user_id   (user_id)
#
class Task < ApplicationRecord
  # user が 複数の task に紐づいている (user_id)
  belongs_to :user
  belongs_to :board

  # task に追加する画像を紐づける
  has_one_attached :graphic

  # validates title, description が無いと保存しない
  validates :title, presence: true
  validates :summary, presence: true

  def display_created_at
    I18n.l(created_at, format: :default)
  end

  def author_name
    user.display_name
  end
end
