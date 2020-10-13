defmodule GeoguessrParty.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :geoguessr_id, :string, null: false
      add :challenge_id, references(:challenges), null: false

      timestamps()
    end

  end
end
