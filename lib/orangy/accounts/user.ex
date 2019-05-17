defmodule Orangy.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :document, :string
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :name, :password_hash, :document])
    |> validate_required([:email, :name, :password_hash, :document])
    |> validate_length(:password, min: 5, max: 20)
    |> unique_constraint(:email, downcase: true)
    |> put_password_hash
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Argon2.hash_pwd_salt(password))
      _ ->
        changeset
    end
  end
end
