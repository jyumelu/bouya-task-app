class BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @tasks = @board.tasks
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

  def edit
    # この書き方以外だとセキュリティ的に問題あり
    # 例
    # @board = boards.find(params[:id])
    # だと、他人の記事を書き換えれてしまう
    # 外部から他人に操作されてはいけないものは 現在のユーザのみ変更を許す
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to boards_path(@board), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    # @board にしてしまうと、view で表示しているのではとなる (文化的な話)
    # board = boards.find(params[:id])
    # だと、他人の記事を書き換えれてしまう
    board = current_user.boards.find(params[:id])
    board.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  private

  # DB 保存する前にカラムに値が入っているかチェック
  def board_params
    params.require(:board).permit(:title, :description)
  end
end
