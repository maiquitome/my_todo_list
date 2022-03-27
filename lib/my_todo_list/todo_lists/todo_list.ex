defmodule MyTodoList.TodoLists.TodoList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todo_lists" do
    field :title, :string

    has_many :todo_items, MyTodoList.TodoItem, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(todo_list, params \\ %{}) do
    todo_list
    |> cast(params, [:title])
    |> validate_required([:title])
    |> cast_assoc(:todo_items, required: true)
  end
end
