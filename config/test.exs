use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :byte_slyce, ByteSlyce.Repo,
  username: System.get_env("PGUSER"),
  password: System.get_env("PGPASSWORD"),
  database: "#{System.get_env("PGDATABASE")}_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: System.get_env("PGHOST"),
  port: System.get_env("PGPORT"),
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :byte_slyce, ByteSlyceWeb.Endpoint,
  http: [port: System.get_env("PHOENIX_PORT")],
  server: true

# config :byte_slyce, :sandbox, Ecto.Adapters.SQL.Sandbox

# Print only warnings and errors during test
config :logger, level: :warn
