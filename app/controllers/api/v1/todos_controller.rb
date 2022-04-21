class Api::V1::TodosController < ApplicationController
  def index
    todos = Todo.first
    render json: todos, each_serializer: TodoSerializer
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo, serializer: TodoSerializer, status: 201
    else
      render json: { errors: todo.errors }, status: 422
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: todo, serializer: TodoSerializer
    else
      render json: { errors: todo.errors }, status: 422
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    render json: todo, serializer: TodoSerializer if todo.destroy
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :user_id)
  end
end
