defmodule MyappWeb.V1.CounterView do
  use MyappWeb, :view

  def render("index.json", %{counters: counters}) do
    %{counters: render_many(counters, MyappWeb.V1.CounterView, "counter.json")}
  end

  def render("counter.json", %{counter: counter}) do
    %{
      name: counter.name,
      count: counter.count,
      count_by: counter.count_by
    }
  end
end
