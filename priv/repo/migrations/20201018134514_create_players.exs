defmodule GeoguessrParty.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :geoguessr_id, :string
      add :nick, :string
      add :game_id, references(:games), null: false

      timestamps()
    end

    create unique_index(:players, [:geoguessr_id])

  end
end
