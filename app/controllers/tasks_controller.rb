class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board

  def index
    # @board = Board.find(params[:id])
    @tasks = current_user.tasks
  end

  def show
    @task = Task.all.find_by(id: params[:board_id])
  end

  def new
    # ログイン中のユーザーとボード情報をセット
    @task = @board.tasks.build(user: current_user)
    @task.user = current_user
  end

  def create
    # ログイン中のユーザーとボード情報をセット
    @task = @board.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      # リダイレクト先は boards/show.haml
      redirect_to board_path(@board), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    # ログイン中のユーザーとボード情報をセット
    @task = @board.tasks.build(user: current_user)
    @task.user = current_user
  end

  private

  # URL パラメータから board_id を取得して設定
  def set_board
    @board = current_user.boards.find(params[:board_id])
  end

  # DB 保存する前にカラムに値が入っているかチェック
  def task_params
    params.require(:task).permit(:title, :summary)
  end
end
