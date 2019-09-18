defmodule MyappWeb.V1.CounterController do
  use MyappWeb, :controller
  alias Myapp.Counter

  def create(conn, %{"counters" => counter_params}) do
    # IO.inspect counter_params
    counter_params
    |>
    Enum.each(fn(x) ->
      Counter.create(x)
    end)

    conn
    |> send_resp(202, "")
  end

  def index(conn, _params) do
    render(conn, "index.json", counters: Myapp.Repo.all(Counter))
  end
end
