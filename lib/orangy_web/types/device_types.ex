defmodule OrangyWeb.Schema.DeviceTypes do
  use Absinthe.Schema.Notation

  object :business_device do
    field :id, :id
    field :description, :string
    field :energy, :integer
    field :name, :string
    field :type, :string
    field :images, non_null(list_of(non_null(:device_images)))
    field :coordinate, :device_coordinate
  end

  object :device_images do
    field :url, :string
    field :sequence, :integer
  end

  object :device_coordinate do
    field :latitude, :float
    field :longitude, :float
  end
end