ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(ByteSlyce.Repo, :manual)
{:ok, _} = Application.ensure_all_started(:wallaby)
