defmodule MyappWeb.Router do
  use MyappWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/v1", MyappWeb.V1, as: :v1 do
    pipe_through :api
    resources "/counters", CounterController, only: [:create, :index]
  end
end
