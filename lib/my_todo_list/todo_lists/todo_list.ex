defmodule MyTodoList.TodoLists.TodoList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todo_lists" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(todo_list, attrs) do
    todo_list
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
