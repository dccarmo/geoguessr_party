defmodule GeoguessrParty.Repo.Migrations.CreateGuesses do
  use Ecto.Migration

  def change do
    create table(:guesses) do
      add :lat, :float
      add :lng, :float
      add :game_id, references(:games), null: false

      timestamps()
    end

  end
end
