defmodule AbuDhabiMuayThaiWeb.Router do
  use AbuDhabiMuayThaiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AbuDhabiMuayThaiWeb do
    pipe_through :api
  end

  scope "/api_graphql" do
    pipe_through :api

    forward "/test", Absinthe.Plug,
            schema: AbuDhabiMuayThaiWeb.Schema.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
            schema: AbuDhabiMuayThaiWeb.Schema.Schema,
            interface: :simple
  end
end
