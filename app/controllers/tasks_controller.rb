class TasksController < ApplicationController
  # 社内アプリの為すべてのページに対してサインインを求める
  before_action :authenticate_user!
  
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