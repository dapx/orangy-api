defmodule Orangy.Repo do
  use Ecto.Repo,
    otp_app: :orangy,
    adapter: Ecto.Adapters.MySQL
end
