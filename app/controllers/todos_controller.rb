class TodosController < ApplicationController
  before_action :set_todo, :only =>[:show, :edit, :update, :destroy, :checkbox]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if  @todo.save
      flash[:notice] = 'success'
      redirect_to todos_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if  @todo.update_attributes(todo_params)
      redirect_to todo_path(@todo)
    else
      render :edit
    end
  end

  def destroy
    if @todo.can_destroy?
       @todo.destroy
      flash[:notice] = "已刪除"
      redirect_to todos_path

    else

      flash[:alert] = "無法刪除，超過期限"
      redirect_to todos_path
    end
  end

  def checkbox
    @todo.update(checkbox: !(@todo.checkbox))
  end


private

  def todo_params
    params.require(:todo).permit(:name, :due_date, :note)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

end
