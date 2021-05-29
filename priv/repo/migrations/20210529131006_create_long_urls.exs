defmodule ByteSlyce.Repo.Migrations.CreateLongUrls do
  use Ecto.Migration

  def change do
    create table(:long_urls) do
      add :url, :string

      timestamps()
    end

  end
end
