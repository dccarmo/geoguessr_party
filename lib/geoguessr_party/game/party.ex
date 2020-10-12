defmodule GeoguessrParty.Game.Party do
  use Ecto.Schema
  import Ecto.Changeset

  schema "parties" do
    field :geoguessr_id, :string

    timestamps()
  end

  @doc false
  def changeset(party, attrs) do
    party
    |> cast(attrs, [:geoguessr_id])
    |> validate_required([:geoguessr_id])
    |> unique_constraint(:geoguessr_id)
  end
end
