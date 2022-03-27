defmodule MyTodoListWeb.PageController do
  use MyTodoListWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
