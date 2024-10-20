class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    # @board = Board.find(params[:id])
    @tasks = Task.all
  end

  def show
    @board = Board.find(params[:id])
    @task = Task.find(params[:id])
  end
end
