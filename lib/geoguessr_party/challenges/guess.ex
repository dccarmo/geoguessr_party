defmodule GeoguessrParty.Challenges.Guess do
  use Ecto.Schema
  import Ecto.Changeset

  schema "guesses" do
    field :lat, :float
    field :lng, :float

    timestamps()

    belongs_to :game, GeoguessrParty.Challenges.Game
  end

  @doc false
  def changeset(guess, attrs) do
    guess
    |> cast(attrs, [:lat, :lng])
    |> validate_required([:lat, :lng])
  end
end
