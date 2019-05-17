defmodule Orangy.BusinessTest do
  use Orangy.DataCase

  alias Orangy.Business

  describe "devices" do
    alias Orangy.Business.Device

    @valid_attrs %{description: "some description", energy: 42, name: "some name", type: "some type"}
    @update_attrs %{description: "some updated description", energy: 43, name: "some updated name", type: "some updated type"}
    @invalid_attrs %{description: nil, energy: nil, name: nil, type: nil}

    def device_fixture(attrs \\ %{}) do
      {:ok, device} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Business.create_device()

      device
    end

    test "list_devices/0 returns all devices" do
      device = device_fixture()
      assert Business.list_devices() == [device]
    end

    test "get_device!/1 returns the device with given id" do
      device = device_fixture()
      assert Business.get_device!(device.id) == device
    end

    test "create_device/1 with valid data creates a device" do
      assert {:ok, %Device{} = device} = Business.create_device(@valid_attrs)
      assert device.description == "some description"
      assert device.energy == 42
      assert device.name == "some name"
      assert device.type == "some type"
    end

    test "create_device/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_device(@invalid_attrs)
    end

    test "update_device/2 with valid data updates the device" do
      device = device_fixture()
      assert {:ok, %Device{} = device} = Business.update_device(device, @update_attrs)
      assert device.description == "some updated description"
      assert device.energy == 43
      assert device.name == "some updated name"
      assert device.type == "some updated type"
    end

    test "update_device/2 with invalid data returns error changeset" do
      device = device_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_device(device, @invalid_attrs)
      assert device == Business.get_device!(device.id)
    end

    test "delete_device/1 deletes the device" do
      device = device_fixture()
      assert {:ok, %Device{}} = Business.delete_device(device)
      assert_raise Ecto.NoResultsError, fn -> Business.get_device!(device.id) end
    end

    test "change_device/1 returns a device changeset" do
      device = device_fixture()
      assert %Ecto.Changeset{} = Business.change_device(device)
    end
  end

  describe "device_images" do
    alias Orangy.Business.DeviceImage

    @valid_attrs %{sequence: 42, url: "some url"}
    @update_attrs %{sequence: 43, url: "some updated url"}
    @invalid_attrs %{sequence: nil, url: nil}

    def device_image_fixture(attrs \\ %{}) do
      {:ok, device_image} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Business.create_device_image()

      device_image
    end

    test "list_device_images/0 returns all device_images" do
      device_image = device_image_fixture()
      assert Business.list_device_images() == [device_image]
    end

    test "get_device_image!/1 returns the device_image with given id" do
      device_image = device_image_fixture()
      assert Business.get_device_image!(device_image.id) == device_image
    end

    test "create_device_image/1 with valid data creates a device_image" do
      assert {:ok, %DeviceImage{} = device_image} = Business.create_device_image(@valid_attrs)
      assert device_image.sequence == 42
      assert device_image.url == "some url"
    end

    test "create_device_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_device_image(@invalid_attrs)
    end

    test "update_device_image/2 with valid data updates the device_image" do
      device_image = device_image_fixture()
      assert {:ok, %DeviceImage{} = device_image} = Business.update_device_image(device_image, @update_attrs)
      assert device_image.sequence == 43
      assert device_image.url == "some updated url"
    end

    test "update_device_image/2 with invalid data returns error changeset" do
      device_image = device_image_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_device_image(device_image, @invalid_attrs)
      assert device_image == Business.get_device_image!(device_image.id)
    end

    test "delete_device_image/1 deletes the device_image" do
      device_image = device_image_fixture()
      assert {:ok, %DeviceImage{}} = Business.delete_device_image(device_image)
      assert_raise Ecto.NoResultsError, fn -> Business.get_device_image!(device_image.id) end
    end

    test "change_device_image/1 returns a device_image changeset" do
      device_image = device_image_fixture()
      assert %Ecto.Changeset{} = Business.change_device_image(device_image)
    end
  end
end
