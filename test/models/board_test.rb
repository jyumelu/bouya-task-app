# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class BoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
