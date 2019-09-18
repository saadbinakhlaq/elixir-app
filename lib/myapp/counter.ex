defmodule Myapp.Counter do
  use Ecto.Schema
  import Ecto.Changeset
  alias Myapp.{Counter, Repo}

  schema "counters" do
    field :actor, :string
    field :app_version, :string
    field :count, :integer, default: 0
    field :count_by, :string
    field :name, :string
    field :platform, :string

    timestamps()
  end

  @doc false
  def changeset(counter, attrs) do
    counter
    |> cast(attrs, [:actor, :app_version, :count, :name, :count_by, :platform])
    |> validate_required([:actor, :app_version, :count, :name, :count_by, :platform])
  end

  def create(attrs \\ %{}) do
    %Counter{}
    |> Counter.changeset(attrs)
    |> Repo.insert
  end
end
