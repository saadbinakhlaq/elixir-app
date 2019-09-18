defmodule Myapp.StartupTasks do
  def init do
    {:ok, _} = Application.ensure_all_started(:myapp)
    IO.inspect("migrate...")
    migrate()
  end
  def migrate do
    path = Application.app_dir(:myapp, "priv/repo/migrations")
    IO.inspect("start migration...")
    Ecto.Migrator.run(Myapp.Repo, path, :up, all: true)
    IO.inspect("end migration...")
  end
end
