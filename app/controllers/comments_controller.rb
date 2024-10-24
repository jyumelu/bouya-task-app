class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comments

  def new
    @comment = @task.comments.build
    @comment.user = current_user
  end

  def create
    @comment = @task.comments.build(comment_params)
    @comment.user = current_user
    if @task.save
      redirect_to board_task_path(@board, @task), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  private

  def set_comments
    @board = Board.find(params[:board_id])
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
