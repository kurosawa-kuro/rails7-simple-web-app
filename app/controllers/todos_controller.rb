class TodosController < ApplicationController
  before_action :set_todo, only: [:show]
  
  def index
    @todos = Todo.includes(:user, :categories).all
  end

  def show
  end

  def new
    @todo = Todo.new
    @users = User.all # 全ユーザーを取得
    @categories = Category.all # 全カテゴリーを取得
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to @todo, notice: 'Todo was successfully created.'
    else
      render :new
    end
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      # カテゴリーIDの配列を受け取れるように `category_ids: []` を追加
      params.require(:todo).permit(:title, :user_id, category_ids: [])
    end
end
