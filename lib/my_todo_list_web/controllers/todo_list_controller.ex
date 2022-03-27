defmodule MyTodoListWeb.TodoListController do
  use MyTodoListWeb, :controller

  alias MyTodoList.TodoLists
  alias MyTodoList.TodoLists.TodoList

  def index(conn, _params) do
    todo_lists = TodoLists.list_todo_lists()
    render(conn, "index.html", todo_lists: todo_lists)
  end

  def new(conn, _params) do
    changeset = TodoList.changeset(%TodoList{todo_items: [%MyTodoList.TodoItem{}, %MyTodoList.TodoItem{}]})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"todo_list" => todo_list_params}) do
    case TodoLists.create_todo_list(todo_list_params) do
      {:ok, todo_list} ->
        conn
        |> put_flash(:info, "Todo list created successfully.")
        |> redirect(to: Routes.todo_list_path(conn, :show, todo_list))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    todo_list = TodoLists.get_todo_list!(id)
    render(conn, "show.html", todo_list: todo_list)
  end

  def edit(conn, %{"id" => id}) do
    todo_list = TodoLists.get_todo_list!(id)

    changeset = TodoLists.change_todo_list(todo_list)
    render(conn, "edit.html", todo_list: todo_list, changeset: changeset)
  end

  def update(conn, %{"id" => id, "todo_list" => todo_list_params}) do
    todo_list = TodoLists.get_todo_list!(id)

    case TodoLists.update_todo_list(todo_list, todo_list_params) do
      {:ok, todo_list} ->
        conn
        |> put_flash(:info, "Todo list updated successfully.")
        |> redirect(to: Routes.todo_list_path(conn, :show, todo_list))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", todo_list: todo_list, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo_list = TodoLists.get_todo_list!(id)
    {:ok, _todo_list} = TodoLists.delete_todo_list(todo_list)

    conn
    |> put_flash(:info, "Todo list deleted successfully.")
    |> redirect(to: Routes.todo_list_path(conn, :index))
  end
end
