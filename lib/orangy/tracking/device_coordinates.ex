defmodule Orangy.Tracking.DeviceCoordinates do
  use Ecto.Schema
  import Ecto.Changeset

  alias Orangy.Business.Device

  schema "device_coordinates" do
    field :latitude, :float
    field :longitude, :float

    belongs_to :device, Device

    timestamps()
  end

  @doc false
  def changeset(device_coordinates, attrs) do
    device_coordinates
    |> cast(attrs, [:latitude, :longitude])
    |> validate_required([:latitude, :longitude])
    |> unique_constraint(:unique_device_constraint, name: :unique_device)
  end
end
