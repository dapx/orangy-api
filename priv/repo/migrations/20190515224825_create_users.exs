defmodule Orangy.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :name, :string
      add :password_hash, :string
      add :document, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
