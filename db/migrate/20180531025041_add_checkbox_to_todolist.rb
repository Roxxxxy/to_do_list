class AddCheckboxToTodolist < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :checkbox, :boolean
  end
end
