defmodule Orangy.TrackingTest do
  use Orangy.DataCase

  alias Orangy.Tracking

  describe "device_coordinates" do
    alias Orangy.Tracking.DeviceCoordinates

    @valid_attrs %{latitude: 120.5, longitude: 120.5}
    @update_attrs %{latitude: 456.7, longitude: 456.7}
    @invalid_attrs %{latitude: nil, longitude: nil}

    def device_coordinates_fixture(attrs \\ %{}) do
      {:ok, device_coordinates} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tracking.create_device_coordinates()

      device_coordinates
    end

    test "list_device_coordinates/0 returns all device_coordinates" do
      device_coordinates = device_coordinates_fixture()
      assert Tracking.list_device_coordinates() == [device_coordinates]
    end

    test "get_device_coordinates!/1 returns the device_coordinates with given id" do
      device_coordinates = device_coordinates_fixture()
      assert Tracking.get_device_coordinates!(device_coordinates.id) == device_coordinates
    end

    test "create_device_coordinates/1 with valid data creates a device_coordinates" do
      assert {:ok, %DeviceCoordinates{} = device_coordinates} = Tracking.create_device_coordinates(@valid_attrs)
      assert device_coordinates.latitude == 120.5
      assert device_coordinates.longitude == 120.5
    end

    test "create_device_coordinates/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracking.create_device_coordinates(@invalid_attrs)
    end

    test "update_device_coordinates/2 with valid data updates the device_coordinates" do
      device_coordinates = device_coordinates_fixture()
      assert {:ok, %DeviceCoordinates{} = device_coordinates} = Tracking.update_device_coordinates(device_coordinates, @update_attrs)
      assert device_coordinates.latitude == 456.7
      assert device_coordinates.longitude == 456.7
    end

    test "update_device_coordinates/2 with invalid data returns error changeset" do
      device_coordinates = device_coordinates_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracking.update_device_coordinates(device_coordinates, @invalid_attrs)
      assert device_coordinates == Tracking.get_device_coordinates!(device_coordinates.id)
    end

    test "delete_device_coordinates/1 deletes the device_coordinates" do
      device_coordinates = device_coordinates_fixture()
      assert {:ok, %DeviceCoordinates{}} = Tracking.delete_device_coordinates(device_coordinates)
      assert_raise Ecto.NoResultsError, fn -> Tracking.get_device_coordinates!(device_coordinates.id) end
    end

    test "change_device_coordinates/1 returns a device_coordinates changeset" do
      device_coordinates = device_coordinates_fixture()
      assert %Ecto.Changeset{} = Tracking.change_device_coordinates(device_coordinates)
    end
  end
end
