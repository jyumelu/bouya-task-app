class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    # 必要なロジックを記述
    @tasks = Task.all
  end

  def show
  end

  def new
  end

  def create
  
  end

  def edit
  end

  def update
  end

  def destroy
  end

end