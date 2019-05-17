defmodule OrangyWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  object :accounts_user do
    field(:id, :id)
    field(:name, :string)
    field(:email, :string)
  end
end
