defmodule GeoguessrParty.Challenges.Challenge do
  use Ecto.Schema
  import Ecto.Changeset

  schema "challenges" do
    field :geoguessr_id, :string

    timestamps()
  end

  @doc false
  def changeset(challenge, attrs) do
    challenge
    |> cast(attrs, [:geoguessr_id])
    |> validate_required([:geoguessr_id])
  end
end
