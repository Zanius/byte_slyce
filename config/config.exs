# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :byte_slyce,
  ecto_repos: [ByteSlyce.Repo]

# Configures the endpoint
config :byte_slyce, ByteSlyceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "K2HncG/TusGlVNYHQrD4Qv+Zu3wGlDbDilaP+Yq9XbpIZPrD7z+n32/Q20T16DwN",
  render_errors: [view: ByteSlyceWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ByteSlyce.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :wallaby, driver: Wallaby.Chrome

config :wallaby, otp_app: :byte_slyce

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
