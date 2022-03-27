defmodule MyTodoList.Repo do
  use Ecto.Repo,
    otp_app: :my_todo_list,
    adapter: Ecto.Adapters.Postgres
end
