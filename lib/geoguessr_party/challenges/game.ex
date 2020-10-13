defmodule GeoguessrParty.Challenges.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :geoguessr_id, :string

    timestamps()

    belongs_to :challenge, GeoguessrParty.Challenges.Challenge
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:geoguessr_id])
    |> validate_required([:geoguessr_id])
    |> unique_constraint(:geoguessr_id)
  end
end
