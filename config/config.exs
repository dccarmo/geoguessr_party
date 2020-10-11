# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :geoguessr_party,
  ecto_repos: [GeoguessrParty.Repo]

# Configures the endpoint
config :geoguessr_party, GeoguessrPartyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uIwaKyxZ8CzpmG6Ox+Hug+/5mbtWZv7qHX14JsKVUaDwoKEWOb0FQKdhVFDshjfQ",
  render_errors: [view: GeoguessrPartyWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: GeoguessrParty.PubSub,
  live_view: [signing_salt: "kXhSl4IR"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
