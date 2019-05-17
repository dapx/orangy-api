defmodule OrangyWeb.Schema do
  use Absinthe.Schema
  import_types __MODULE__.UserTypes
  import_types __MODULE__.DeviceTypes

  alias Orangy.Accounts.UserResolver
  alias Orangy.Business.DeviceResolver

  query do
    field :accounts_users, list_of(:accounts_user) do
      resolve &UserResolver.all/2
    end

    field :accounts_user, :accounts_user do
      arg(:email, non_null(:string))
      resolve &UserResolver.find/2
    end

    field :device, :business_device do
      arg(:id, non_null(:id))
      resolve &DeviceResolver.find/2
    end

    field :devices, non_null(list_of(non_null(:business_device))) do
      arg :latitude, non_null(:float)
      arg :longitude, non_null(:float)
      arg :distance, :float, default_value: 10
      resolve &DeviceResolver.find_devices_by_distance/2
    end
  end
end