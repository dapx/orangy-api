defmodule OrangyWeb.Router do
  use OrangyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", OrangyWeb do
    pipe_through :api
  end
end
