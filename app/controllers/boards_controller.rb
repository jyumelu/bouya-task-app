class BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    # @board = Board.new
    @board = current_user.boards.build
  end

  def create
    # new で入力した form のデータを取得
    @board = current_user.boards.build(board_params)
    # DB に保存
    if @board.save
      redirect_to boards_path(@board), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  private

  # DB 保存する前にカラムに値が入っているかチェック
  def board_params
    params.require(:board).permit(:title, :description)
  end
end
