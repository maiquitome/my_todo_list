defmodule MyTodoList.Repo.Migrations.CreateTodoLists do
  use Ecto.Migration

  def change do
    create table(:todo_lists) do
      add :title, :string

      timestamps()
    end
  end
end
