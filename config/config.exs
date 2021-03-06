# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :booking,
  ecto_repos: [Booking.Repo]

# Configures the endpoint
config :booking, BookingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QnZ34sU+MbNmI4c8G3AuFlvaZTpwCxMo9kcom/6RWybiOL1TczmIhq51PWRpdjgd",
  render_errors: [view: BookingWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Booking.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "+70Ks06+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :booking, :pow,
  user: Booking.Users.User,
  repo: Booking.Repo,
  web_module: BookingWeb

config :booking, :pow_assent,
  providers: [
    github: [
      client_id: "142456b34b08439b72e2",
      client_secret: "1763be77c7e39d377507990de520cdb0e493aa5e",
      strategy: Assent.Strategy.Github
    ]
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
