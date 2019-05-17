defmodule Orangy.Repo.Migrations.CreateDeviceCoordinates do
  use Ecto.Migration

  def change do
    create table(:device_coordinates) do
      add :latitude, :float
      add :longitude, :float
      add :device_id, references(:devices, on_delete: :nothing)

      timestamps()
    end

    create index(:device_coordinates, [:device_id])
    create unique_index(:device_coordinates, [:device_id], name: :unique_device)
  end
end
