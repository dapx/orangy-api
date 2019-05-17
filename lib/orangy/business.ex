defmodule Orangy.Business do
  @moduledoc """
  The Business context.
  """

  import Ecto.Query, warn: false
  alias Orangy.Repo

  alias Orangy.Business.Device

  @query_by_distance """
  SELECT
    devices.id,
    name,
    description,
    devices.inserted_at,
    devices.updated_at,
    (
      6371 * acos (
        cos ( radians(?) )
        * cos( radians( device_coordinates.latitude ) )
        * cos( radians( device_coordinates.longitude ) - radians(?) )
        + sin ( radians(?) )
        * sin( radians( device_coordinates.latitude ) )
      )
    ) AS distance
  FROM devices left join device_coordinates
  ON devices.id = device_coordinates.device_id
  HAVING distance < ?
  ORDER BY distance;
  """

  @doc """
  Returns the list of stores with preloaded associations based on distance.

    Example:
      > Orangy.Business.list_stores_by_distance(%{
          latitude: -26.4885497, longitude: -49.0769937
        }, [])

  """
  def list_devices_by_distance(coordinates, preload) do
    query_devices_by_distance(coordinates)
    |> load_devices
    |> Orangy.Repo.preload(preload)
  end

  defp load_devices(raw_query_result) do
    Enum.map(
      raw_query_result.rows,
      &Orangy.Repo.load(
        Orangy.Business.Device, {raw_query_result.columns, &1}
      )
    )
  end

  defp query_devices_by_distance(
    %{ latitude: latitude, longitude: longitude, distance: distance_km }
  ) do
    Ecto.Adapters.SQL.query!(
      Orangy.Repo,
      @query_by_distance,
      [latitude, longitude, latitude, distance_km]
    )
  end


  @doc """
  Returns the list of devices.

  ## Examples

      iex> list_devices()
      [%Device{}, ...]

  """
  def list_devices do
    Repo.all(from d in Device, preload: [:coordinate, :images])
  end

  @doc """
  Gets a single device.

  Raises `Ecto.NoResultsError` if the Device does not exist.

  ## Examples

      iex> get_device!(123)
      %Device{}

      iex> get_device!(456)
      ** (Ecto.NoResultsError)

  """
  def get_device!(id), do: Repo.get!(Device, id)

  def get_device(id) do
    case Repo.get(Device, id) do
      nil -> {:error, nil}
      user -> {:ok, user |> Repo.preload([:coordinate, :images])}
    end
  end

  @doc """
  Creates a device.

  ## Examples

      iex> create_device(%{field: value})
      {:ok, %Device{}}

      iex> create_device(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_device(attrs \\ %{}) do
    %Device{}
    |> Device.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a device.

  ## Examples

      iex> update_device(device, %{field: new_value})
      {:ok, %Device{}}

      iex> update_device(device, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_device(%Device{} = device, attrs) do
    device
    |> Device.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Device.

  ## Examples

      iex> delete_device(device)
      {:ok, %Device{}}

      iex> delete_device(device)
      {:error, %Ecto.Changeset{}}

  """
  def delete_device(%Device{} = device) do
    Repo.delete(device)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking device changes.

  ## Examples

      iex> change_device(device)
      %Ecto.Changeset{source: %Device{}}

  """
  def change_device(%Device{} = device) do
    Device.changeset(device, %{})
  end

  alias Orangy.Business.DeviceImage

  @doc """
  Returns the list of device_images.

  ## Examples

      iex> list_device_images()
      [%DeviceImage{}, ...]

  """
  def list_device_images do
    Repo.all(DeviceImage)
  end

  @doc """
  Gets a single device_image.

  Raises `Ecto.NoResultsError` if the Device image does not exist.

  ## Examples

      iex> get_device_image!(123)
      %DeviceImage{}

      iex> get_device_image!(456)
      ** (Ecto.NoResultsError)

  """
  def get_device_image!(id), do: Repo.get!(DeviceImage, id)

  @doc """
  Creates a device_image.

  ## Examples

      iex> create_device_image(%{field: value})
      {:ok, %DeviceImage{}}

      iex> create_device_image(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_device_image(attrs \\ %{}) do
    %DeviceImage{}
    |> DeviceImage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a device_image.

  ## Examples

      iex> update_device_image(device_image, %{field: new_value})
      {:ok, %DeviceImage{}}

      iex> update_device_image(device_image, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_device_image(%DeviceImage{} = device_image, attrs) do
    device_image
    |> DeviceImage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a DeviceImage.

  ## Examples

      iex> delete_device_image(device_image)
      {:ok, %DeviceImage{}}

      iex> delete_device_image(device_image)
      {:error, %Ecto.Changeset{}}

  """
  def delete_device_image(%DeviceImage{} = device_image) do
    Repo.delete(device_image)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking device_image changes.

  ## Examples

      iex> change_device_image(device_image)
      %Ecto.Changeset{source: %DeviceImage{}}

  """
  def change_device_image(%DeviceImage{} = device_image) do
    DeviceImage.changeset(device_image, %{})
  end
end
