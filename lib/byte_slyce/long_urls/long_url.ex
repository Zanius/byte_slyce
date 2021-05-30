defmodule ByteSlyce.LongUrls.LongUrl do
  use Ecto.Schema
  import Ecto.Changeset

  schema "long_urls" do
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(long_url, attrs) do
    long_url
    |> cast(attrs, [:url])
    |> validate_required([:url])
    |> validate_format(:url, ~r/http(s)?:\/\//,
      message: "Invalid url, must start with https:// or http://"
    )
  end
end
