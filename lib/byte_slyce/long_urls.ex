defmodule ByteSlyce.LongUrls do
  @moduledoc """
  The LongUrls context.
  """

  import Ecto.Query, warn: false
  alias ByteSlyce.Repo
  alias ByteSlyce.LongUrls.LongUrl

  @doc """
  Returns the list of long_urls.

  ## Examples

      iex> list_long_urls()
      [%LongUrl{}, ...]

  """
  def list_long_urls do
    Repo.all(LongUrl)
  end

  @doc """
  Gets a single long_url.

  Raises `Ecto.NoResultsError` if the Long url does not exist.

  ## Examples

      iex> get_long_url!(123)
      %LongUrl{}

      iex> get_long_url!(456)
      ** (Ecto.NoResultsError)

  """
  def get_long_url!(id), do: Repo.get!(LongUrl, id)

  @doc """
  Finds a single long url by decoding it's slug.

  Raises `Ecto.NoResultsError` if the Long url does not exist.

  ## Examples

      iex> get_long_url_by_slug!(k1)
      %LongUrl{}

      iex> get_long_url_by_slug!(a5)
      ** (Ecto.NoResultsError)

  """
  def get_long_url_by_slug!(slug) do
    slug
    |> decode_slug
    |> get_long_url!
  end

  @doc """
  Creates a long_url.

  ## Examples

      iex> create_long_url(%{field: value})
      {:ok, %LongUrl{}}

      iex> create_long_url(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_long_url(attrs \\ %{}) do
    %LongUrl{}
    |> LongUrl.changeset(attrs)
    |> Repo.insert()
  end

  def encode_url_id(id) do
    Base62.encode(id)
  end

  defp decode_slug(slug) do
    Base62.decode!(slug)
  end
end
