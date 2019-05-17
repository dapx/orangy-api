defmodule Orangy.Tracking do
  @moduledoc """
  The Tracking context.
  """

  import Ecto.Query, warn: false
  alias Orangy.Repo

  alias Orangy.Tracking.DeviceCoordinates

  @doc """
  Returns the list of device_coordinates.

  ## Examples

      iex> list_device_coordinates()
      [%DeviceCoordinates{}, ...]

  """
  def list_device_coordinates do
    Repo.all(DeviceCoordinates)
  end

  @doc """
  Gets a single device_coordinates.

  Raises `Ecto.NoResultsError` if the Device coordinates does not exist.

  ## Examples

      iex> get_device_coordinates!(123)
      %DeviceCoordinates{}

      iex> get_device_coordinates!(456)
      ** (Ecto.NoResultsError)

  """
  def get_device_coordinates!(id), do: Repo.get!(DeviceCoordinates, id)

  @doc """
  Creates a device_coordinates.

  ## Examples

      iex> create_device_coordinates(%{field: value})
      {:ok, %DeviceCoordinates{}}

      iex> create_device_coordinates(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_device_coordinates(attrs \\ %{}) do
    %DeviceCoordinates{}
    |> DeviceCoordinates.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a device_coordinates.

  ## Examples

      iex> update_device_coordinates(device_coordinates, %{field: new_value})
      {:ok, %DeviceCoordinates{}}

      iex> update_device_coordinates(device_coordinates, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_device_coordinates(%DeviceCoordinates{} = device_coordinates, attrs) do
    device_coordinates
    |> DeviceCoordinates.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a DeviceCoordinates.

  ## Examples

      iex> delete_device_coordinates(device_coordinates)
      {:ok, %DeviceCoordinates{}}

      iex> delete_device_coordinates(device_coordinates)
      {:error, %Ecto.Changeset{}}

  """
  def delete_device_coordinates(%DeviceCoordinates{} = device_coordinates) do
    Repo.delete(device_coordinates)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking device_coordinates changes.

  ## Examples

      iex> change_device_coordinates(device_coordinates)
      %Ecto.Changeset{source: %DeviceCoordinates{}}

  """
  def change_device_coordinates(%DeviceCoordinates{} = device_coordinates) do
    DeviceCoordinates.changeset(device_coordinates, %{})
  end
end
