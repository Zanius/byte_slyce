defmodule ByteSlyce.Repo do
  use Ecto.Repo,
    otp_app: :byte_slyce,
    adapter: Ecto.Adapters.Postgres
end
