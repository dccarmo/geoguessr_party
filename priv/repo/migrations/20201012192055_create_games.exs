defmodule GeoguessrParty.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :geoguessr_id, :string

      timestamps()
    end

    create unique_index(:games, [:geoguessr_id])

  end
end
