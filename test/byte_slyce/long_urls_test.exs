defmodule ByteSlyce.LongUrlsTest do
  use ByteSlyce.DataCase

  alias ByteSlyce.LongUrls

  describe "long_urls" do
    alias ByteSlyce.LongUrls.LongUrl

    @valid_attrs %{url: "some url"}
    @update_attrs %{url: "some updated url"}
    @invalid_attrs %{url: nil}

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

    test "create_long_url/1 with valid data creates a long_url" do
      assert {:ok, %LongUrl{} = long_url} = LongUrls.create_long_url(@valid_attrs)
      assert long_url.url == "some url"
    end

    test "create_long_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LongUrls.create_long_url(@invalid_attrs)
    end

    test "update_long_url/2 with valid data updates the long_url" do
      long_url = long_url_fixture()
      assert {:ok, %LongUrl{} = long_url} = LongUrls.update_long_url(long_url, @update_attrs)
      assert long_url.url == "some updated url"
    end

    test "update_long_url/2 with invalid data returns error changeset" do
      long_url = long_url_fixture()
      assert {:error, %Ecto.Changeset{}} = LongUrls.update_long_url(long_url, @invalid_attrs)
      assert long_url == LongUrls.get_long_url!(long_url.id)
    end

    test "delete_long_url/1 deletes the long_url" do
      long_url = long_url_fixture()
      assert {:ok, %LongUrl{}} = LongUrls.delete_long_url(long_url)
      assert_raise Ecto.NoResultsError, fn -> LongUrls.get_long_url!(long_url.id) end
    end

    test "change_long_url/1 returns a long_url changeset" do
      long_url = long_url_fixture()
      assert %Ecto.Changeset{} = LongUrls.change_long_url(long_url)
    end
  end
end
