defmodule ByteSlyce.LongUrlsTest do
  use ByteSlyce.DataCase

  alias ByteSlyce.LongUrls

  describe "long_urls" do
    alias ByteSlyce.LongUrls.LongUrl

    @valid_attrs %{url: "https://www.someurl.com"}
    @invalid_attrs %{url: "www.someurl.com"}

    def long_url_fixture(attrs \\ %{}) do
      {:ok, long_url} =
        attrs
        |> Enum.into(@valid_attrs)
        |> LongUrls.create_long_url()

      long_url
    end

    test "list_long_urls/0 returns all long_urls" do
      long_url = long_url_fixture()
      assert LongUrls.list_long_urls() == [long_url]
    end

    test "get_long_url!/1 returns the long_url with given id" do
      long_url = long_url_fixture()
      assert LongUrls.get_long_url!(long_url.id) == long_url
    end

    test "get_long_url_by_slug!/1 returns the long_url with correct id from decoded slug" do
      long_url = long_url_fixture()
      slug = LongUrls.encode_url_id(long_url.id)
      assert LongUrls.get_long_url_by_slug!(slug) == long_url
    end

    test "create_long_url/1 with valid data creates a long_url" do
      assert {:ok, %LongUrl{} = long_url} = LongUrls.create_long_url(@valid_attrs)
      assert long_url.url == "https://www.someurl.com"
    end

    test "create_long_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LongUrls.create_long_url(@invalid_attrs)
    end
  end
end
