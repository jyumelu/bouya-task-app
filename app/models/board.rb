# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
  # user が 複数のboard に紐づいている (user_id)
  belongs_to :user
  has_many :tasks, dependent: :destroy
  # validates title, description が無いと保存しない
  validates :title, presence: true
  validates :description, presence: true

  def display_created_at
    I18n.l(created_at, format: :default)
  end

  def author_name
    user.display_name
  end
end
