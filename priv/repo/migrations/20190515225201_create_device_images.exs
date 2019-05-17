defmodule Orangy.Repo.Migrations.CreateDeviceImages do
  use Ecto.Migration

  def change do
    create table(:device_images) do
      add :url, :string
      add :sequence, :integer
      add :device_id, references(:devices, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:device_images, [:device_id, :sequence], name: :unique_sequence_by_device)
  end
end
