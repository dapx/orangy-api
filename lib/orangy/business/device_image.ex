defmodule Orangy.Business.DeviceImage do
  use Ecto.Schema
  import Ecto.Changeset
  alias Orangy.Business.Device

  schema "device_images" do
    field :sequence, :integer
    field :url, :string
    belongs_to :device, Device

    timestamps()
  end

  @doc false
  def changeset(device_image, attrs) do
    device_image
    |> cast(attrs, [:url, :sequence])
    |> validate_required([:url, :sequence])
    |> unique_constraint(:unique_sequence_constraint, name: :unique_sequence_by_device)
  end
end
