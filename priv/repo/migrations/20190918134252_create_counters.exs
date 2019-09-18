defmodule Myapp.Repo.Migrations.CreateCounters do
  use Ecto.Migration

  def change do
    create table(:counters) do
      add :actor, :string
      add :app_version, :string
      add :count, :integer
      add :name, :string
      add :count_by, :string
      add :platform, :string


      timestamps()
    end

  end
end
