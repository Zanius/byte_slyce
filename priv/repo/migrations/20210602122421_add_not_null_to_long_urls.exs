defmodule ByteSlyce.Repo.Migrations.AddNotNullToLongUrls do
  use Ecto.Migration

  def change do
    alter table(:long_urls) do
      modify(:url, :string, null: false, from: :string)
    end
  end
end
