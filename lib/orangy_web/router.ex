defmodule OrangyWeb.Router do
  use OrangyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: OrangyWeb.Schema,
      interface: :simple,
      context: %{pubsub: OrangyWeb.Endpoint}

    forward "/graphql", Absinthe.Plug,
      schema: OrangyWeb.Schema,
      context: %{pubsub: OrangyWeb.Endpoint}
  end
end
