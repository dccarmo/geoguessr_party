defmodule GeoguessrParty.Repo.Migrations.PartyUniqueGeoguessrId do
  use Ecto.Migration

  def change do
    create unique_index(:parties, [:geoguessr_id])
  end
end
