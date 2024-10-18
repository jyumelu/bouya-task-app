class BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    # @board = Board.find(params[:id])
    # @board = current_user.boards.build
  end
end
