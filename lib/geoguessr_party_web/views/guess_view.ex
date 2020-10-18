defmodule GeoguessrPartyWeb.GuessView do
  use GeoguessrPartyWeb, :view
  alias GeoguessrPartyWeb.GuessView

  def render("index.json", %{guesses: guesses}) do
    %{data: render_many(guesses, GuessView, "guess.json")}
  end

  def render("show.json", %{guess: guess}) do
    %{data: render_one(guess, GuessView, "guess.json")}
  end

  def render("guess.json", %{guess: guess}) do
    %{id: guess.id,
      lat: guess.lat,
      lng: guess.lng}
  end
end
