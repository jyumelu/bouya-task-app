class BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = Board.all
  end

  def show
    @boards = Board.all
  end
end
