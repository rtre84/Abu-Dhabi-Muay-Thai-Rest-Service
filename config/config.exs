# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :admuaythairest,
  namespace: AbuDhabiMuayThai,
  ecto_repos: [AbuDhabiMuayThai.Repo]

# Configures the endpoint
config :admuaythairest, AbuDhabiMuayThaiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YDZc4mga2QhHpOc6hC9zquE/ng7I/LQZfZ/8/Bj7LX8aZYsrY+2h5FhGV5doZ9k8",
  render_errors: [view: AbuDhabiMuayThaiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: AbuDhabiMuayThai.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
