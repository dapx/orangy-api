defmodule Orangy.Repo.Migrations.CreateDevices do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :name, :string
      add :description, :string
      add :energy, :integer
      add :type, :string

      timestamps()
    end

    create unique_index(:devices, [:name])
  end
end
