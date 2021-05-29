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

  @doc """
  Updates a long_url.

  ## Examples

      iex> update_long_url(long_url, %{field: new_value})
      {:ok, %LongUrl{}}

      iex> update_long_url(long_url, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_long_url(%LongUrl{} = long_url, attrs) do
    long_url
    |> LongUrl.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a long_url.

  ## Examples

      iex> delete_long_url(long_url)
      {:ok, %LongUrl{}}

      iex> delete_long_url(long_url)
      {:error, %Ecto.Changeset{}}

  """
  def delete_long_url(%LongUrl{} = long_url) do
    Repo.delete(long_url)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking long_url changes.

  ## Examples

      iex> change_long_url(long_url)
      %Ecto.Changeset{data: %LongUrl{}}

  """
  def change_long_url(%LongUrl{} = long_url, attrs \\ %{}) do
    LongUrl.changeset(long_url, attrs)
  end
end
