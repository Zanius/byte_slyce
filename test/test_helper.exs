ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(ByteSlyce.Repo, :manual)
Application.put_env(:wallaby, :base_url, ByteSlyceWeb.Endpoint.url)
{:ok, _} = Application.ensure_all_started(:wallaby)
