class CategoriesController < ApplicationController
    before_action :set_category, only: [:show]

    def index
      @categories = Category.all
    end

    def show
      # 既に@categoryはset_categoryによって設定されています
      # このカテゴリーに関連するTodoを取得する
      @todos = @category.todos
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to @category, notice: 'Category was successfully created.'
      else
        render :new
      end
    end
  
    private
      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:title)
      end
  end
  