# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pokefight,
  ecto_repos: [Pokefight.Repo]

# Configures the endpoint
config :pokefight, PokefightWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mDp4Vf4cwc4CB/f4EeSZGAqxBB75rAjG4NHfYORoJ8pCNzvLEPjZFm1gYlwqmHHq",
  render_errors: [view: PokefightWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Pokefight.PubSub,
  live_view: [signing_salt: "4h4m8Jc8"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :phoenix, :json_library, Poison

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
