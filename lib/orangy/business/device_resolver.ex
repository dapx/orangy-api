defmodule Orangy.Business.DeviceResolver do
  alias Orangy.Business

  def all(_args, _info) do
    {:ok, Business.list_devices()}
  end

  def find_devices_by_distance(args, _info) do
    devices = Business.list_devices_by_distance(args, [:coordinate, :images])
    {:ok, devices}
  end

  def find(args, _info) do
    Business.get_device(args.id)
  end
end