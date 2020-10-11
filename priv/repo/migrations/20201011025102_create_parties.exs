defmodule GeoguessrParty.Repo.Migrations.CreateParties do
  use Ecto.Migration

  def change do
    create table(:parties) do
      add :geoguessr_id, :string

      timestamps()
    end

  end
end
