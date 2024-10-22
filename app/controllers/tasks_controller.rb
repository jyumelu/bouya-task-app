class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board

  def show
    # @board.tasks ではなく Task を直接使う
    @task = Task.find(params[:id])
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
    @task = @board.tasks.find(params[:id])
    @task.user = current_user
    # @task.user = current_user
    # @task = Task.find(params[:id])
  end

  def update
    @task = @board.tasks.find(params[:id])
    @task.user = current_user
    if @task.update(task_params)
      redirect_to board_path(@board), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    task = @board.tasks.find(params[:id])
    task.user = current_user
    task.destroy!
    # redirect_to board_path(@board), notice: '削除に成功しました'
    redirect_to root_path, notice: '削除に成功しました'
  end

  private

  # URL パラメータから board_id を取得して設定
  def set_board
    @board = Board.find(params[:board_id])
  end

  # DB 保存する前にカラムに値が入っているかチェック
  def task_params
    params.require(:task).permit(:title, :summary, :deadline, :graphic)
  end
end
