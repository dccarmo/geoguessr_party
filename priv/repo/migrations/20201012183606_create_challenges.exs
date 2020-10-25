defmodule GeoguessrParty.Repo.Migrations.CreateChallenges do
  use Ecto.Migration

  def change do
    create table(:challenges) do
      add :geoguessr_id, :string, null: false

      timestamps()
    end

    create unique_index(:challenges, [:geoguessr_id])
  end
end
