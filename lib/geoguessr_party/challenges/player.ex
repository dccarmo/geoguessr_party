defmodule GeoguessrParty.Challenges.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :geoguessr_id, :string
    field :nick, :string

    timestamps()

    belongs_to :game, GeoguessrParty.Challenges.Game
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:geoguessr_id, :nick])
    |> validate_required([:geoguessr_id, :nick])
  end
end
