class CreateJoinTableCategoryTodo < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :todos do |t|
      # t.index [:category_id, :todo_id]
      # t.index [:todo_id, :category_id]
    end
  end
end
