# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixiruserauth,
  ecto_repos: [Elixiruserauth.Repo]

# Configures the endpoint
config :elixiruserauth, ElixiruserauthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dp1jRGO3g7+uE9Q++hJ0HDNmB8+CHQdSwk32bPR253QEbBskOBEZ8mJuzy9ZP1Wu",
  render_errors: [view: ElixiruserauthWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Elixiruserauth.PubSub,
  live_view: [signing_salt: "uHFMFiSj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
