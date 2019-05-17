defmodule Orangy.Business.Device do
  use Ecto.Schema
  import Ecto.Changeset
  alias Orangy.Business.DeviceImage
  alias Orangy.Tracking.DeviceCoordinates

  schema "devices" do
    field :description, :string
    field :energy, :integer
    field :name, :string
    field :type, :string

    has_many :images, DeviceImage
    has_one :coordinate, DeviceCoordinates

    timestamps()
  end

  @doc false
  def changeset(device, attrs) do
    device
    |> cast(attrs, [:name, :description, :energy, :type])
    |> validate_required([:name, :description, :energy, :type])
    |> unique_constraint(:name)
  end
end
